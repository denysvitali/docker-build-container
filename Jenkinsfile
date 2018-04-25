node {
    stage('Checkout') {
        checkout scm
    }

    stage('Build Image'){
        def customImage = docker.build("dvitali/build-container:latest")
    }

    stage('Push Image') {
        def JENKIN_VERSION = sh returnStdout: true, script: "cat Dockerfile | head -n 1 | awk -F ':' '{print \$2}' | awk -F '-' '{print \$1}'"
        withCredentials([usernamePassword(
            credentialsId: "docker-hub-dvitali",
            usernameVariable: "USER",
            passwordVariable: "PASS"
        )]) {
            sh "docker login -u $USER -p $PASS"
        }

        sh "docker tag dvitali/build-container:latest dvitali/build-container:$BUILD_NUMBER"
        sh "docker tag dvitali/build-container:latest dvitali/build-container:$JENKINS_VERSION"
        sh "docker push dvitali/build-container:latest"
        sh "docker push dvitali/build-container:$BUILD_NUMBER"
    }
}
