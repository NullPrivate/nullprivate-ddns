#!/bin/bash
#
# AdGuard Home DDNS Update Script
# For Linux/macOS systems
#

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration - modify before running
base_url="{{server_name}}" # Example: http://localhost:34020 or https://dns.example.com
username="{{username}}"    # AdGuard Home username
password="{{password}}"    # AdGuard Home password
domain="{{domain}}"        # Domain to update, e.g.: home.example.com
cookies="{{cookies}}"      # Cookie string for authentication, e.g.: "agh_session=abc123"

# DDNS Configuration
enable_ipv4="true" # Enable IPv4 DDNS updates
enable_ipv6="true" # Enable IPv6 DDNS updates

# WARNING: Cookies may expire over time, which could cause authentication failures.
# It is recommended to use username/password authentication whenever possible.
# Only use cookies if username/password authentication is not available.

# Debug mode switch (0=off, 1=on)
DEBUG=0

# Debug log function
debug_log() {
    if [ $DEBUG -eq 1 ]; then
        echo -e "${BLUE}[DEBUG] $1${NC}"
    fi
}

# Check dependencies
check_dependencies() {
    debug_log "Checking dependencies"

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

    debug_log "Getting current public ${ip_version} address"

    if [ "$ip_version" = "ipv4" ]; then
        curl_opts="-4"
        services=(
            "https://api.ipify.org"
            "https://ifconfig.me/ip"
            "https://icanhazip.com"
            "https://ipinfo.io/ip"
        )
    else
        curl_opts="-6"
        services=(
            "https://api6.ipify.org"
            "https://ifconfig.co"
            "https://icanhazip.com"
            "https://api6.my-ip.io/ip"
        )
    fi

    for service in "${services[@]}"; do
        debug_log "Trying to get ${ip_version} from $service"
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
        debug_log "Failed to get valid ${ip_version} from $service"
    done

    echo ""
    return 1
}

# Generate auth header
get_auth_header() {
    debug_log "Generating authentication header"

    if [ -n "$username" ] && [ -n "$password" ]; then
        debug_log "Using username/password authentication"
        auth_base64=$(echo -n "$username:$password" | base64)
        echo "Authorization: Basic $auth_base64"
    elif [ -n "$cookies" ]; then
        debug_log "Using cookie authentication"
        echo -e "${YELLOW}Warning: Using cookies for authentication. Cookies may expire over time.${NC}"
        echo "Cookie: $cookies"
    else
        debug_log "No authentication method available"
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

# Get current DNS record for domain
get_current_record() {
    local ip_version="$1"
    local auth_header=$(get_auth_header)
    local CURL_OPTS=$(get_curl_opts)

    if [ -z "$auth_header" ]; then
        echo -e "${RED}Error: No authentication method available${NC}"
        exit 1
    fi

    debug_log "Getting current ${ip_version} record for domain '${domain}'"

    response=$(curl $CURL_OPTS -H "$auth_header" ${base_url}/control/rewrite/list)

    if [[ $response == *"401"* || $response == *"Unauthorized"* ]]; then
        echo -e "${RED}Error: Authentication failed. If using cookies, they may have expired.${NC}"
        echo -e "${RED}Please update your authentication information and try again.${NC}"
        exit 1
    fi

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
        debug_log "Domain record not found"
        echo ""
        return 1
    fi
}

# Delete existing DNS record
delete_existing_record() {
    local record="$1"
    local auth_header=$(get_auth_header)
    local CURL_OPTS=$(get_curl_opts)

    debug_log "Deleting existing DNS record"

    response=$(curl $CURL_OPTS -X POST -H "Content-Type: application/json" \
        -H "$auth_header" \
        -d "$record" \
        ${base_url}/control/rewrite/delete)
    echo -e "${GREEN}Deleted existing DNS record${NC}"
}

# Create new DNS record
create_new_record() {
    local new_ip="$1"
    local ip_version="$2"
    local auth_header=$(get_auth_header)
    local CURL_OPTS=$(get_curl_opts)

    debug_log "Creating new ${ip_version} record: ${domain} -> $new_ip"

    response=$(curl $CURL_OPTS -X POST \
        -H "Content-Type: application/json" \
        -H "$auth_header" \
        -d "{\"domain\": \"${domain}\", \"answer\": \"$new_ip\"}" \
        ${base_url}/control/rewrite/add 2>&1)
    echo -e "${GREEN}Created new DNS record: ${domain} -> $new_ip${NC}"
}

# Update DNS record for specific IP version
update_dns_record() {
    local ip_version="$1"
    local current_ip=""

    # Get current IP address
    current_ip=$(get_current_ip "$ip_version")
    if [ -z "$current_ip" ]; then
        echo -e "${YELLOW}Warning: Unable to get current $ip_version address, skipping $ip_version update${NC}"
        return
    fi
    echo -e "Current $ip_version: ${GREEN}$current_ip${NC}"

    # Get current DNS record for this IP version
    existing_record=$(get_current_record "$ip_version")

    if [ ! -z "$existing_record" ]; then
        debug_log "Found existing DNS record: $existing_record"

        # Extract the current IP from existing record
        existing_ip=$(echo "$existing_record" | grep -o '"answer":"[^"]*"' | cut -d'"' -f4)
        debug_log "Existing IP: $existing_ip"

        # Compare IPs
        if [ "$current_ip" = "$existing_ip" ]; then
            echo -e "${GREEN}DNS record is up to date (${domain} -> $current_ip)${NC}"
            return
        fi

        echo -e "Updating ${YELLOW}$domain${NC} record from $existing_ip to $current_ip..."

        # Update existing record with new IP
        local CURL_OPTS=$(get_curl_opts)
        debug_log "Updating DNS record: ${domain} -> $current_ip"
        response=$(curl $CURL_OPTS -X PUT \
            -H "Content-Type: application/json" \
            -H "$auth_header" \
            -d "{\"target\": $existing_record, \"update\": {\"domain\": \"${domain}\", \"answer\": \"$current_ip\"}}" \
            ${base_url}/control/rewrite/update)

        echo -e "${GREEN}Updated DNS record: ${domain} -> $current_ip${NC}"
    else
        echo -e "Domain $domain ${YELLOW}has no ${ip_version} record yet${NC}"
        # Create new record if none exists
        create_new_record "$current_ip" "$ip_version"
    fi
}

# Check authentication method
check_auth() {
    if [ -z "$username" ] || [ -z "$password" ]; then
        if [ -z "$cookies" ]; then
            echo -e "${RED}Error: No authentication method available.${NC}"
            echo -e "${RED}Please provide either username/password or cookies.${NC}"
            exit 1
        else
            echo -e "${YELLOW}Warning: Using cookies for authentication. Username/password is recommended as cookies may expire.${NC}"
        fi
    fi
}

# Main function
main() {
    echo -e "${BLUE}AdGuard Home DDNS Update Script${NC}"
    echo -e "${BLUE}=============================${NC}"

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
