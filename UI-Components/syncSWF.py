
#   ###############
#       IMPORTS
#   ###############

import os
import shutil

#   ###################
#       DIRECTORIES
#   ###################

#   SOURCE DIRECTORY
sourceDir = os.getcwd() + "\\UI-Components\\"

#   TARGET DIRECTORY
targetDir = os.getcwd() + \
    "\\Public\\S7_UI_Components_Library_b66d56c6-12f9-4abc-844f-0c30b89d32e4\\GUI\\"

#   #################
#       SYNC SWFS
#   #################

for subdirectory, directory, files in os.walk(sourceDir):
    for fileName in files:
        filePath = subdirectory + os.sep + fileName

        if filePath.endswith(".swf"):
            shutil.copy(filePath, os.path.join(targetDir + fileName))

            dashes = "-" * len(fileName)
            print(
                f"{fileName}\n{dashes}\nMoved swf at {sourceDir + fileName}\n to {targetDir + fileName}\n")
