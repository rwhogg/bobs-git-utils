#!/usr/bin/env ruby

# Note: this is not called git-branchname to avoid conflict with the tool of
# the same name from moz-git-utils

def getBranchName
    branchname = `git branchname`.strip.split(" ")
    if branchname.length >= 4
        # Two possibilities: in the middle of a bisect or not attached to a branch at the moment
        if branchname[3] == "bisect"
            "bisect " + `git rev-parse HEAD`
        else
            # (HEAD detached at remote/branch)
            gitBranchPart = branchname[3]
            gitBranchNamePart = gitBranchPart.split("/")[1]
            gitBranchNamePart.chomp(")").strip
        end
    else
        # Checked out on a branch
        branchname[0]
    end
end

puts getBranchName
