#!/usr/bin/env node

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title ClearCache.js
// @raycast.mode fullOutput

// Optional parameters:
// @raycast.icon 🤖
// @raycast.packageName Maintenance Tools
// @raycast.needsConfirmation true

// Documentation:
// @raycast.description Clear User Cache
// @raycast.author ramzimalhas
// @raycast.authorURL https://raycast.com/ramzimalhas91

const { exec } = require('child_process');

// Function to clear user cache
function clearUserCache() {
    console.log("Clearing user cache...");
    
    // Define command to delete files in the Caches directory
    const command = `find ~/Library/Caches/ -type f -exec rm {} +`;
    
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`Stderr: ${stderr}`);
            return;
        }
        console.log(stdout);
        console.log("User cache cleared. Note: Some directories are protected and not cleared.");
    });
}

// Execute the cache clearing function
clearUserCache();