#!/bin/sh

# Test script for link/unlink functionality
# This script verifies that the dotfiles linking and unlinking works correctly
# Updated for file discovery approach (no longer uses YAML/yq)

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

# Test 2: Error handling - missing confs directory
echo "Test 2: Error handling - missing confs directory"
mv confs confs.backup

if HOME="$TEST_HOME" sh lib/unlink.sh 2>/dev/null; then
    echo "Error: unlink.sh should have failed when confs directory is missing"
    mv confs.backup confs
    exit 1
fi

mv confs.backup confs
echo "✓ Test 2 passed"

# Test 3: Error handling - missing confs directory for link.sh
echo "Test 3: Error handling - missing confs directory for link.sh"
mv confs confs.backup

if HOME="$TEST_HOME" sh lib/link.sh 2>/dev/null; then
    echo "Error: link.sh should have failed when confs directory is missing"
    mv confs.backup confs
    exit 1
fi

mv confs.backup confs
echo "✓ Test 3 passed"

# Cleanup
rm -rf "$TEST_HOME"

echo "All tests passed! link/unlink functionality works correctly with file discovery."