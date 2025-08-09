#!/bin/sh

# Test script for link/unlink functionality
# This script verifies that the dotfiles linking and unlinking works correctly

set -e

echo "Starting link/unlink test..."

# Create a temporary test directory
TEST_HOME="/tmp/dotfiles_test_$$"
mkdir -p "$TEST_HOME"
echo "Using test home directory: $TEST_HOME"

# Test 1: Normal link/unlink cycle
echo "Test 1: Normal link/unlink cycle"
HOME="$TEST_HOME" make
LINK_COUNT=$(find "$TEST_HOME" -type l | wc -l)
echo "Created $LINK_COUNT symbolic links"

if [ "$LINK_COUNT" -eq 0 ]; then
    echo "Error: No symbolic links were created"
    exit 1
fi

HOME="$TEST_HOME" make clean
REMAINING_LINKS=$(find "$TEST_HOME" -type l | wc -l)
echo "Remaining symbolic links: $REMAINING_LINKS"

if [ "$REMAINING_LINKS" -ne 0 ]; then
    echo "Error: Some symbolic links were not removed"
    find "$TEST_HOME" -type l
    exit 1
fi

echo "✓ Test 1 passed"

# Test 2: Error handling - missing links.yml
echo "Test 2: Error handling - missing links.yml"
mv lib/links.yml lib/links.yml.backup

if HOME="$TEST_HOME" sh lib/unlink.sh 2>/dev/null; then
    echo "Error: unlink.sh should have failed when links.yml is missing"
    mv lib/links.yml.backup lib/links.yml
    exit 1
fi

mv lib/links.yml.backup lib/links.yml
echo "✓ Test 2 passed"

# Test 3: Error handling - yq not available
echo "Test 3: Error handling - yq not available"
# Create a fake yq that fails
mkdir -p /tmp/fake_bin
cat > /tmp/fake_bin/yq << 'EOF'
#!/bin/sh
echo "yq: command not found" >&2
exit 127
EOF
chmod +x /tmp/fake_bin/yq

if PATH="/tmp/fake_bin:/bin:/usr/bin" HOME="$TEST_HOME" sh lib/unlink.sh 2>/dev/null; then
    echo "Error: unlink.sh should have failed when yq is not available"
    exit 1
fi

echo "✓ Test 3 passed"

# Cleanup
rm -rf "$TEST_HOME" /tmp/fake_bin

echo "All tests passed! unlink.sh works correctly."