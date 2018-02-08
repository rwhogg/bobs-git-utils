#!/usr/bin/env ruby

# Note: this is not called git-branchname to avoid conflict with the tool of
# the same name from moz-git-utils

def getBranchName
    branchname = `git branchname`.strip.split(" ")
    if branchname.length >= 4
        # Two possibilities: in the middle of a bisect or not attached to a branch at the moment
        if branchname[2] == "bisect"
            "bisect-" + `git rev-parse HEAD`
        else
            # (HEAD detached at <commit-ish>)
            gitBranchPart = branchname[3].chomp(")").strip

            # check for <remote>/<branch>
            if gitBranchPart.include? "/"
                gitBranchPart.split("/")[1]
            else
                # (HEAD detached at <commit>)
                "commit-" + gitBranchPart
            end
        end
    else
        # Checked out on a branch
        branchname[0]
    end
end

puts getBranchName
