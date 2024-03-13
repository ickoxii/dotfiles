D_GROUP_ID:=edu.baylor.ecs.csi3471.YourName
D_ARTIFACT_ID:=asgmtName

all:
	echo "1. Create a new directory"
	echo "2. Move this file to the new directory"
	echo "3. Edit the D_GROUP_ID and D_ARTIFACT_ID variables in the Makefile"
	echo "4. Run \`make build-mvn\`"
.PHONY: all

build-mvn:
	mvn archetype:generate \
	-DgroupId=$(D_GROUP_ID) \
	-DartifactId=$(D_ARTIFACT_ID) \
	-DarchetypeArtifactId=maven-archetype-quickstart \
	-DinteractiveMode=false
.PHONY: build-mvn
