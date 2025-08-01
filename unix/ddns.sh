#!/bin/bash
#
# AdGuard Private DDNS Update Script
# For Linux/macOS systems
#

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Default configuration values
base_url=""
username=""
password=""
domain=""
cookies=""
enable_ipv4="true"
enable_ipv6="true"
DEBUG=0

# Display usage information
show_usage() {
    echo -e "${BLUE}Usage:${NC}"
    echo -e "  Run the script with the following command line options:"
    echo -e "  ${YELLOW}-b, --base-url${NC}     AdGuard Private server URL (e.g., https://public3.adguardprivate.com)"
    echo -e "  ${YELLOW}-u, --username${NC}    AdGuard Private username"
    echo -e "  ${YELLOW}-p, --password${NC}    AdGuard Private password"
    echo -e "  ${YELLOW}-d, --domain${NC}      Domain to update (e.g., nas.example.com)"
    echo -e "  ${YELLOW}-c, --cookies${NC}     Cookie string for authentication (e.g., \"agh_session=abc123\")"
    echo -e "  ${YELLOW}-4, --ipv4${NC}        Enable/disable IPv4 DDNS updates (true/false)"
    echo -e "  ${YELLOW}-6, --ipv6${NC}        Enable/disable IPv6 DDNS updates (true/false)"
    echo -e "  ${YELLOW}-D, --debug${NC}       Enable debug mode"
    echo -e "  ${YELLOW}-h, --help${NC}        Show this help message"
    echo -e ""
    echo -e "  Example usage:"
    echo -e "    ./ddns.sh -b https://public3.adguardprivate.com -u jqknono -p 123456li -d nas.home"
    echo -e ""
    echo -e "    # OR using cookies instead of username/password:"
    echo -e "    ./ddns.sh -b https://public3.adguardprivate.com -c \"agh_session=abc123\" -d nas.home"
    echo -e ""
    echo -e "    # OR disabling IPv6 updates:"
    echo -e "    ./ddns.sh -b https://public3.adguardprivate.com -u jqknono -p 123456li -d nas.home --ipv6 false"
    echo -e ""
    echo -e "${BLUE}Note:${NC} This script is specifically developed for adguardprivate.com"
    exit 1
}

# Parse command line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -b|--base-url)
                base_url="$2"
                shift 2
                ;;
            -u|--username)
                username="$2"
                shift 2
                ;;
            -p|--password)
                password="$2"
                shift 2
                ;;
            -d|--domain)
                domain="$2"
                shift 2
                ;;
            -c|--cookies)
                cookies="$2"
                shift 2
                ;;
            -4|--ipv4)
                enable_ipv4="$2"
                shift 2
                ;;
            -6|--ipv6)
                enable_ipv6="$2"
                shift 2
                ;;
            -D|--debug)
                DEBUG=1
                shift
                ;;
            -h|--help)
                show_usage
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                show_usage
                ;;
        esac
    done
}

# Print curl command function
print_curl_cmd() {
    echo -e "${YELLOW}[CURL] $1${NC}"
}

# Check dependencies
check_dependencies() {
    DEPS=("curl" "grep" "awk")
    MISSING=0

    for dep in "${DEPS[@]}"; do
        if ! command -v "$dep" &>/dev/null; then
            echo -e "${RED}Error: Required program '$dep' not found${NC}"
            MISSING=1
        fi
    done

    if [ $MISSING -eq 1 ]; then
        echo -e "${RED}Please install missing dependencies and retry${NC}"
        exit 1
    fi
}

# Get current public IP addresses
get_current_ip() {
    local ip_version="$1"
    local curl_opts=""
    local services=()

    if [ "$ip_version" = "ipv4" ]; then
        curl_opts="-4"
        services=(
            "https://api.ipify.org"
            "https://ifconfig.me/ip"
            "https://icanhazip.com"
            "https://ipinfo.io/ip"
            "https://4.ipw.cn"
        )
    else
        curl_opts="-6"
        services=(
            "https://api6.ipify.org"
            "https://ifconfig.co"
            "https://icanhazip.com"
            "https://api6.my-ip.io/ip"
            "https://6.ipw.cn"
        )
    fi

    for service in "${services[@]}"; do
        current_ip=$(curl -s $curl_opts "$service")

        if [ "$ip_version" = "ipv4" ]; then
            if [[ $current_ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                echo "$current_ip"
                return 0
            fi
        else
            if [[ $current_ip =~ ^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$ ]]; then
                echo "$current_ip"
                return 0
            fi
        fi
    done

    echo ""
    return 1
}

# Generate auth header
get_auth_header() {
    if [ -n "$username" ] && [ -n "$password" ]; then
        auth_base64=$(echo -n "$username:$password" | base64)
        echo "Authorization: Basic $auth_base64"
    elif [ -n "$cookies" ]; then
        echo "Cookie: $cookies"
    else
        echo ""
    fi
}

# Get curl options for API access
get_curl_opts() {
    if [ $DEBUG -eq 1 ]; then
        echo "-S --connect-timeout 10 --max-time 15"
    else
        echo "-sS --connect-timeout 10 --max-time 15"
    fi
}

# Get all DNS records
get_all_dns_records() {
    local auth_header=$(get_auth_header)
    local CURL_OPTS=$(get_curl_opts)

    if [ -z "$auth_header" ]; then
        echo -e "${RED}Error: No authentication method available${NC}"
        exit 1
    fi

    # Ensure base_url includes protocol
    if [[ ! "$base_url" =~ ^https?:// ]]; then
        base_url="https://$base_url"
    fi

    if [ $DEBUG -eq 1 ]; then
        echo "DEBUG: Using authentication method: $(if [ -n "$username" ] && [ -n "$password" ]; then echo "Basic Auth"; else echo "Cookies"; fi)"
        echo "DEBUG: Base URL: $base_url"
    fi

    print_curl_cmd "curl $CURL_OPTS -H \"$auth_header\" ${base_url}/control/rewrite/list"
    response=$(curl $CURL_OPTS -H "$auth_header" ${base_url}/control/rewrite/list)

    if [[ $response == *"401"* || $response == *"Unauthorized"* ]]; then
        echo -e "${RED}Error: Authentication failed. If using cookies, they may have expired.${NC}"
        echo -e "${RED}Please update your authentication information and try again.${NC}"
        exit 1
    fi

    echo "$response"
}

# Get current DNS record for domain
get_current_record() {
    local ip_version="$1"
    local auth_header=$(get_auth_header)
    local CURL_OPTS=$(get_curl_opts)

    if [ -z "$auth_header" ]; then
        echo -e "${RED}Error: No authentication method available${NC}"
        exit 1
    fi

    # Ensure base_url includes protocol
    if [[ ! "$base_url" =~ ^https?:// ]]; then
        base_url="https://$base_url"
    fi

    print_curl_cmd "curl $CURL_OPTS -H \"$auth_header\" ${base_url}/control/rewrite/list"
    response=$(curl $CURL_OPTS -H "$auth_header" ${base_url}/control/rewrite/list)

    if [[ $response == *"401"* || $response == *"Unauthorized"* ]]; then
        echo -e "${RED}Error: Authentication failed. If using cookies, they may have expired.${NC}"
        echo -e "${RED}Please update your authentication information and try again.${NC}"
        exit 1
    fi

    # Check if this is a valid JSON response
    if [[ $response == "400 Bad Request" ]]; then
        echo ""
        return 1
    fi

    # If this is an AdGuard Private response with the items field (newer versions)
    if [[ $response == *"\"items\""* ]]; then
        if [[ $response == *"\"domain\":\"${domain}\""* ]]; then
            # Filter records based on IP version
            if [ "$ip_version" = "ipv4" ]; then
                # Find record with IPv4 answer (matches x.x.x.x format)
                current_record=$(echo "$response" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" | grep -o "{[^}]*\"answer\":\"[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\"[^}]*}" | head -1)
            else
                # Find record with IPv6 answer (matches hex format with colons)
                current_record=$(echo "$response" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" | grep -o "{[^}]*\"answer\":\"[0-9a-fA-F:]\+\"[^}]*}" | grep -v "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" | head -1)
            fi
            echo "$current_record"
            return 0
        else
            echo ""
            return 1
        fi
    else
        # For direct record listing in older versions
        if [[ $response == *"\"domain\":\"${domain}\""* ]]; then
            # Filter records based on IP version
            if [ "$ip_version" = "ipv4" ]; then
                # Find record with IPv4 answer (matches x.x.x.x format)
                current_record=$(echo "$response" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" | grep -o "{[^}]*\"answer\":\"[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\"[^}]*}" | head -1)
            else
                # Find record with IPv6 answer (matches hex format with colons)
                current_record=$(echo "$response" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" | grep -o "{[^}]*\"answer\":\"[0-9a-fA-F:]\+\"[^}]*}" | grep -v "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" | head -1)
            fi
            echo "$current_record"
            return 0
        else
            echo ""
            return 1
        fi
    fi
}

# Create new DNS record
create_new_record() {
    local new_ip="$1"
    local ip_version="$2"
    local auth_header=$(get_auth_header)
    local CURL_OPTS=$(get_curl_opts)

    # Ensure base_url includes protocol
    if [[ ! "$base_url" =~ ^https?:// ]]; then
        base_url="https://$base_url"
    fi

    # Properly escape the JSON data
    local json_data="{\"domain\": \"${domain}\", \"answer\": \"$new_ip\"}"

    print_curl_cmd "curl $CURL_OPTS -X POST -H \"Content-Type: application/json\" -H \"$auth_header\" -d \"$json_data\" ${base_url}/control/rewrite/add"
    
    # Execute the curl command but ignore the response as the API doesn't return meaningful data
    curl $CURL_OPTS -X POST \
        -H "Content-Type: application/json" \
        -H "$auth_header" \
        -d "$json_data" \
        ${base_url}/control/rewrite/add >/dev/null 2>&1

    echo -e "${GREEN}Created new DNS record: ${domain} -> $new_ip${NC}"

    # Wait a moment for the changes to propagate
    sleep 1

    # List all records to check if our record was set correctly
    local all_records=$(get_all_dns_records)

    # Print the response from get_all_dns_records
    echo -e "${CYAN}All DNS records:${NC}"
    echo "$all_records"

    echo -e "${CYAN}Checking if new record was created correctly...${NC}"

    # Parse the records to find our new record
    if [[ "$all_records" == *"\"domain\":\"${domain}\""* ]]; then
        if [ "$ip_version" = "ipv4" ]; then
            # Look for IPv4 record matching our domain and IP
            verify_record=$(echo "$all_records" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" |
                grep -o "{[^}]*\"answer\":\"$new_ip\"[^}]*}" | head -1)
        else
            # Look for IPv6 record matching our domain and IP
            verify_record=$(echo "$all_records" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" |
                grep -o "{[^}]*\"answer\":\"$new_ip\"[^}]*}" | head -1)
        fi

        if [ ! -z "$verify_record" ]; then
            echo -e "${GREEN}Verified: Record was created successfully: ${domain} -> $new_ip${NC}"
            return 0
        else
            echo -e "${RED}Failed to verify record creation: Record not found in the list.${NC}"
            return 1
        fi
    else
        echo -e "${RED}Failed to verify record creation: Domain not found in records.${NC}"
        return 1
    fi
}

# Update DNS record for specific IP version
update_dns_record() {
    local ip_version="$1"
    local current_ip=""

    # Get current IP address
    current_ip=$(get_current_ip "$ip_version")
    if [ -z "$current_ip" ]; then
        echo -e "${YELLOW}Warning: Unable to get current $ip_version address, skipping $ip_version update${NC}"
        return 1
    fi
    echo -e "Current $ip_version: ${GREEN}$current_ip${NC}"

    # Get all DNS records
    all_records=$(get_all_dns_records)

    # Print the response from get_all_dns_records
    echo -e "${CYAN}All DNS records:${NC}"
    echo "$all_records"

    # Check if API returned an error
    if [[ "$all_records" == "400 Bad Request" || "$all_records" == *"\"error\""* ]]; then
        echo -e "${RED}Error: API returned error when fetching records${NC}"
        # Try to create a new record without verification
        create_new_record "$current_ip" "$ip_version"
        return $?
    fi

    # Check if domain exists in records
    local domain_exists=false
    local existing_record=""
    local existing_ip=""

    if [[ "$all_records" == *"\"domain\":\"${domain}\""* ]]; then
        domain_exists=true

        # Search for the specific IP version record
        if [ "$ip_version" = "ipv4" ]; then
            # Find record with IPv4 answer (matches x.x.x.x format)
            existing_record=$(echo "$all_records" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" |
                grep -o "{[^}]*\"answer\":\"[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\"[^}]*}" | head -1)
        else
            # Find record with IPv6 answer (matches hex format with colons)
            existing_record=$(echo "$all_records" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" |
                grep -o "{[^}]*\"answer\":\"[0-9a-fA-F:]\+\"[^}]*}" |
                grep -v "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" | head -1)
        fi

        if [ ! -z "$existing_record" ]; then
            # Extract the current IP from existing record
            existing_ip=$(echo "$existing_record" | grep -o '"answer":"[^"]*"' | cut -d'"' -f4)

            echo -e "Found existing ${ip_version} record: ${domain} -> ${existing_ip}"

            # Compare IPs
            if [ "$current_ip" = "$existing_ip" ]; then
                echo -e "${GREEN}DNS record is up to date (${domain} -> $current_ip)${NC}"
                return 0
            fi

            # Update existing record with new IP
            echo -e "Updating ${YELLOW}$domain${NC} record from $existing_ip to $current_ip..."
            local auth_header=$(get_auth_header)
            local CURL_OPTS=$(get_curl_opts)

            # Format the JSON correctly for update
            # Create a new object with updated IP instead of modifying existing record
            local update_json="{\"domain\": \"${domain}\", \"answer\": \"$current_ip\"}"
            
            # Add any other fields from the existing record if they exist
            # Extract all field names except domain and answer
            local fields=$(echo "$existing_record" | grep -o '"[^"]*":' | sed 's/://g' | sed 's/"//g' | grep -v -E '^(domain|answer)$')
            
            # Process each field
            for field in $fields; do
                # Extract the value for this field
                local field_value=$(echo "$existing_record" | grep -o "\"$field\":\"[^\"]*\"" | cut -d'"' -f4)
                if [ -n "$field_value" ]; then
                    # Properly escape the field value for JSON
                    local escaped_value=$(echo "$field_value" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g')
                    update_json=$(echo "$update_json" | sed "s/}/, \"$field\": \"$escaped_value\"}/")
                fi
            done

            print_curl_cmd "curl $CURL_OPTS -X PUT -H \"Content-Type: application/json\" -H \"$auth_header\" -d '$update_json' ${base_url}/control/rewrite/update"

            # Execute the curl command but ignore the response
            curl $CURL_OPTS -X PUT \
                -H "Content-Type: application/json" \
                -H "$auth_header" \
                -d "$update_json" \
                ${base_url}/control/rewrite/update >/dev/null 2>&1

            # Wait a moment for the changes to propagate
            sleep 1

            # List all records to check if our record was updated correctly
            local updated_records=$(get_all_dns_records)

            echo -e "${CYAN}Checking if record was updated correctly...${NC}"

            # Look for our specific record in the updated records
            if [ "$ip_version" = "ipv4" ]; then
                # Look for IPv4 record matching our domain and new IP
                verify_record=$(echo "$updated_records" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" |
                    grep -o "{[^}]*\"answer\":\"$current_ip\"[^}]*}" | head -1)
            else
                # Look for IPv6 record matching our domain and new IP
                verify_record=$(echo "$updated_records" | grep -o "{[^}]*\"domain\":\"${domain}\"[^}]*}" |
                    grep -o "{[^}]*\"answer\":\"$current_ip\"[^}]*}" | head -1)
            fi

            if [ ! -z "$verify_record" ]; then
                echo -e "${GREEN}Verified: Record was updated successfully: ${domain} -> $current_ip${NC}"
                return 0
            else
                echo -e "${RED}Failed to verify record update: Record not found in the list.${NC}"
                return 1
            fi
        else
            echo -e "Domain $domain exists but ${YELLOW}has no ${ip_version} record yet${NC}"
            # Create a new record for this IP version
            create_new_record "$current_ip" "$ip_version"
            return $?
        fi
    else
        echo -e "Domain $domain ${YELLOW}does not exist in DNS records${NC}"
        # Create a new record for this domain
        create_new_record "$current_ip" "$ip_version"
        return $?
    fi
}

# Check if all essential parameters are provided
check_params() {
    local missing=0

    # Check base_url
    if [ -z "$base_url" ]; then
        echo -e "${RED}Error: Server URL (base_url) is required${NC}"
        missing=1
    fi

    # Check domain
    if [ -z "$domain" ]; then
        echo -e "${RED}Error: Domain name (domain) is required${NC}"
        missing=1
    fi

    # Check authentication
    if [ -z "$username" ] || [ -z "$password" ]; then
        if [ -z "$cookies" ]; then
            echo -e "${RED}Error: Authentication is required (either username/password or cookies)${NC}"
            missing=1
        fi
    fi

    # Show usage if any essential parameter is missing
    if [ $missing -eq 1 ]; then
        echo -e ""
        show_usage
    fi
}

# Check authentication method
check_auth() {
    if [ -z "$username" ] || [ -z "$password" ]; then
        if [ -z "$cookies" ]; then
            echo -e "${RED}Error: No authentication method available.${NC}"
            echo -e "${RED}Please provide either username/password or cookies.${NC}"
            show_usage
        else
            echo -e "${YELLOW}Warning: Using cookies for authentication. Username/password is recommended as cookies may expire.${NC}"
        fi
    fi
}

# Main function
main() {
    echo -e "${BLUE}AdGuard Private DDNS Update Script${NC}"
    echo -e "${BLUE}=============================${NC}"

    # Parse command line arguments
    parse_args "$@"

    # Check if all essential parameters are provided
    check_params

    # Check authentication method
    check_auth

    # Check required dependencies
    check_dependencies

    # Update IPv4 record if enabled
    if [ "$enable_ipv4" = "true" ]; then
        echo -e "\n${BLUE}Updating IPv4 record${NC}"
        echo -e "${BLUE}------------------${NC}"
        update_dns_record "ipv4"
    else
        echo -e "\n${YELLOW}IPv4 updates disabled${NC}"
    fi

    # Update IPv6 record if enabled
    if [ "$enable_ipv6" = "true" ]; then
        echo -e "\n${BLUE}Updating IPv6 record${NC}"
        echo -e "${BLUE}------------------${NC}"
        update_dns_record "ipv6"
    else
        echo -e "\n${YELLOW}IPv6 updates disabled${NC}"
    fi

    echo -e "\n${GREEN}DDNS update completed${NC}"
}

# Execute main function
main "$@"
