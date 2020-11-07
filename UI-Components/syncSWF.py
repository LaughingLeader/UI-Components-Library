
#   ###############
#       IMPORTS
#   ###############

import os
import shutil

#   ###################
#       DIRECTORIES
#   ###################

sourceDir = "\\UI-Components\\"
targetDir = "\\Public\\S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4\\GUI\\"

currentWorkingDir = os.getcwd()

sourceDir = currentWorkingDir + sourceDir
targetDir = currentWorkingDir + targetDir

#   #################
#       SYNC SWFS
#   #################

for subdirectory, directory, files in os.walk(sourceDir):
    for fileName in files:
        filePath = subdirectory + os.sep + fileName

    if filePath.endswith(".swf"):
        shutil.copy(filePath, os.path.join(targetDir + fileName))
        print(f"Moved swf at {sourceDir + fileName}\n to {targetDir + fileName}\n")