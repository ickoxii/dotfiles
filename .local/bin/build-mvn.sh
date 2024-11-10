#!/usr/bin/env bash
# V3

group_id="edu.baylor.ecs.csi3471"
artifact_id="Maven-Project"
version="0.0.1-SNAPSHOT"
main_class="Main.java"

# template_pom="~/skeleton-files/maven/template-pom.xml"
# template_make="~/skeleton-files/maven/Makefile"

template_pom="/Users/ickoxii/skeleton-files/maven/template-pom.xml"
template_make="/Users/ickoxii/skeleton-files/maven/Makefile.template"

print_help() {
    echo "Usage: $0 "
    echo "[-g|--group       <group_id>]"
    echo "  This is the name of the organization that owns this project"
    echo "[-a|--artifact    <artifact_id>]"
    echo "  This is the name of the project itself"
    echo "[-v|--version     <version>]"
    echo "  This is the version number"
    echo "  Add XX-SNAPSHOT if the build is still in development"
    echo "[-m|--main-class  <main_class>]"
    echo "  This is the class that contains the 'main' method"
    echo "[-h|--help        print this menu]"
    echo "  kinda self explanatory"
    echo ""
    echo "Example Usage:"
    echo "  ./init.sh -g edu.baylor.ecs.csi3471.JonesBaylor -a lab3 -v 0.0.1-SNAPSHOT -m Main.java"
    echo "  ./init.sh --group edu.baylor.ecs --artifact My-Project"
    echo ""
    echo "Notes:"
    echo "  * This script does not support any names/variables that contain a space"
    exit 0
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case  "$1" in
        -g|--group) group_id="$2"; shift ;;
        -a|--artifact) artifact_id="$2"; shift ;;
        -v|--version) version="$2"; shift ;;
        -m|--main-class) main_class="$2"; shift ;;
        -h|--help) print_help ;;
        *) echo "Unknown option: $1"; exit ;;
    esac
    shift
done

# Do not accept any extra arguments (or arguments that contain a space)
if [ "$#" -gt 0 ]; then
    echo "Unexpected argument: $1"
    echo "Do not use spaces in your argument names"
    exit 1
fi

# Display the configured values
echo ""
echo "Beginning build with the following options:"
echo "Group ID: $group_id"
echo "Artifact ID: $artifact_id"
echo "Version: $version"
echo "Main Class: $main_class"
main_class_noext="${main_class%%.*}"
echo "Main Class No Extension: $main_class_noext"

while true; do
    # Prompt the user for input
    echo ""
    read -p "Do you want to continue? (y/n): " choice

    # Check if the input is 'y' or 'Y'
    if [[ $choice == "y" || $choice == "Y" ]]; then
        echo "Continuing..."
        # Continue with your script logic here
        break
    # Check if the input is 'n' or 'N'
    elif [[ $choice == "n" || $choice == "N" ]]; then
        echo "use \`./init.sh -h\` for information on how to use this script"
        echo "Exiting..."
        echo ""
        exit 1
    else
        # Invalid response, reprompt
        echo "Invalid response. Please enter 'y/Y' or 'n/N'."
    fi
done

# Generate a Maven Project
set_group="-DgroupID=$group_id"
set_artifact="-DartifactId=$artifact_id"
set_archetype="-DarchetypeArtifactId=maven-archetype-quickstart"
set_interact="-DinteractiveMode=false"


# Generate Makefile to build Maven project
echo "Generating Maven project..."
mvn archetype:generate -DgroupId=$group_id -DartifactId=$artifact_id -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
# sed -e "s/D_GROUP_ID:=.*/D_GROUP_ID:=$group_id/g; \
#         s/D_ARTIFACT_ID:=.*/D_ARTIFACT_ID:=$artifact_id/g" $template_make > Makefile
# make build-mvn
# rm Makefile
echo "-----"

echo "cd $artifact_id"
cd $artifact_id
echo "-----"

# Copy template
echo "Copying templates"
cp $template_pom pom.xml
cp $template_make Makefile
echo "-----"

# Edit pom
echo "Making edits to template pom..."
sed -i "" \
    "s/<groupId><!--[^<]*<\/groupId>/<groupId>${group_id}<\/groupId>/g; \
    s/<artifactId><!--[^<]*<\/artifactId>/<artifactId>${artifact_id}<\/artifactId>/g; \
    s/<version><!--[^<]*<\/version>/<version>${version}<\/version>/g; \
    s/<mainClass><!--[^<]*<\/mainClass>/<mainClass>${group_id}.${artifact_id}.${main_class_noext}<\/mainClass>/g" pom.xml
echo "-----"

# Edit makefile
echo "Making edits to Makefile..."
sed -i "" \
    "s/JAR_NAME=replace/JAR_NAME=${artifact_id}-${version}.jar/g; \
    s/ARTIFACT_ID=replace/ARTIFACT_ID=${artifact_id}/g;" Makefile
echo "-----"

# Rename the Java files
group_dir=$(echo "$group_id" | sed 's/\./\//g')

echo "Creating directories..."
mkdir src/main/java/$group_dir/$artifact_id
mkdir src/test/java/$group_dir/$artifact_id
echo "-----"

echo "Renaming java files..."
mv src/main/java/$group_dir/App.java src/main/java/$group_dir/$artifact_id/${main_class_noext}.java
mv src/test/java/$group_dir/AppTest.java src/test/java/$group_dir/$artifact_id/${main_class_noext}Test.java
echo "-----"

echo "Making edits to package/class names..."
old_pkg="package ${group_id}";
new_pkg="package ${group_id}.${artifact_id}";

sed -i "" "s/${old_pkg}/${new_pkg}/g" src/main/java/${group_dir}/${artifact_id}/${main_class_noext}.java
sed -i "" "s/${old_pkg}/${new_pkg}/g" src/test/java/${group_dir}/${artifact_id}/${main_class_noext}Test.java

sed -i "" "s/App/${main_class_noext}/g" src/main/java/${group_dir}/${artifact_id}/${main_class_noext}.java
sed -i "" "s/AppTest/${main_class_noext}Test/g" src/test/java/${group_dir}/${artifact_id}/${main_class_noext}Test.java
echo "-----"
