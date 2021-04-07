# ========================================================
# Scans all sub-directories and generates UIIDEHelpers.lua
# ========================================================

import os   # OS Module
import re   # Regex Module

lua = ''    # LuaFile

#   Maps Flash DataTypes to Lua DataTypes
replacers = {
    'MovieClip': 'FlashObject',
    'Array': 'FlashArray',
    'int': 'number',
    'String': 'string',
    'Boolean': 'boolean',
    'Number': 'number',
    'uint': 'number'
}


#   SCAN FILES
#   ==========

# Scans sub-directories
for dirPath, dirNames, files in os.walk(os.path.dirname(__file__)):
    #   Search for *\MainTimeline.as
    for fileName in files:
        if fileName != 'MainTimeline.as':
            continue

        package = ''    # Package Name. Used to determine Lua ClassName
        vars = []  # Public properties of the FlashObject
        functions = []  # Public methods of the FlashObject

        #   Read *\MainTimeline.as file
        with open(dirPath + '\\MainTimeline.as', 'r') as f:
            for line in f:

                #   EXTRACT INFORMATION
                #   ===================

                #   Determine package name
                if package == '':
                    pack = re.findall(
                        r'^package (\w+)_fla$', line.strip())
                    if pack != []:
                        package = pack[0]

                #   Extract public variables of FlashObject
                for x in re.findall(r'^public \w+ (\w+):(\w+)', line.strip()):
                    key, value = x[0], x[1]
                    try:
                        value = value.replace(value, replacers[value])
                    except KeyError:
                        value = value.replace(value, 'FlashObject')
                    vars.append((key, value))

                #   Extract public methods of FlashObject
                for y in re.findall(r'public function (\w+)\((.*)\)[: (\w+)]?', line.strip()):

                    #   Extract function params
                    params = []
                    for z in re.findall(r'(\w+):(\w+)', y[1]):
                        key, value = z[0], z[1]
                        try:
                            value = value.replace(value, replacers[value])
                        except KeyError:
                            value = value.replace(value, 'FlashObject')
                        params.append((key, value))

                    key, value = y[0], params
                    functions.append((key, value))

        #   Continue without writing if no package was found
        if package == '':
            continue

        #   WRITE LUA
        #   =========

        #   CLASS DEFINITION
        #   ----------------

        lua += '---@class UIRoot_{}: FlashObject @{}\n'.format(
            package, package)

        for x in vars:
            lua += '---@field {} {}\n'.format(x[0], x[1])

        lua += '{} = {{}}\n\n'.format(package)

        #   FUNCTION DEFINITIONS
        #   --------------------

        for y in functions:
            params = []
            for z in y[1]:
                params.append(z[0])
                lua += '---@param {} {}\n'.format(z[0], z[1])

            paramsString = ', '.join(params)
            lua += 'function {}.{}({}) end\n\n'.format(package,
                                                       y[0], paramsString)

        #   ==========
        #   WRITE FILE
        #   ==========

        with open(os.path.dirname(__file__) + '\\UIIDEHelpers.lua', 'w+') as luaFile:
            luaFile.write(lua)
        luaFile.close()
