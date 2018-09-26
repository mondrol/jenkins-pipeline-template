#!groovy

node {
    checkout scm
    openshift.withProject("getup-images") {
        createBuildConfig()
        build()
    }
}

def createBuildConfig()
{
    def bc = openshift.selector("buildconfig", "${JOB_NAME}")

    if (!bc.exists()) {
        print "Creating BuildConfig ${JOB_NAME}"
        def objects = openshift.process(readFile(file: 'template.yaml'),
                            "-p=JOB_NAME=${JOB_NAME}",
                            "-p=SOURCE_GIT_URI=${params.SOURCE_GIT_URI}",
                            "-p=SOURCE_GIT_REF=${params.SOURCE_GIT_REF}",
                            "-p=SOURCE_GIT_DIR=${params.SOURCE_GIT_DIR}",
                            "-p=OUTPUT_IMAGE=${params.OUTPUT_IMAGE}",
                            "-p=IMAGE_TAG=${params.IMAGE_TAG}")
        openshift.create(objects)
    } else {
        print "BuildConfig ${JOB_NAME} already exists"
    }
}

def build()
{
    openshiftBuild bldCfg: "${JOB_NAME}", showBuildLogs: 'true', waitTime: '30', waitUnit: 'min'
}
