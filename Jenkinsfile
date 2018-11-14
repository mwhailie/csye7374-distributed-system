podTemplate(label: 'mypod', containers: [
    containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('mypod') {
        def repository
        stage('Build Docker Image') {
            container('docker') {
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', 
                            credentialsId: 'dockerhub',
                            usernameVariable: 'DOCKER_HUB_USER', 
                            passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
                    git credentialsId: 'a37d972d-be32-44fe-a6c7-c2f8fc5da303', url: 'https://github.com/mwhailie/csye7374-fall2018.git'
                    sh "ls -al"
                    repository = "${env.DOCKER_HUB_USER}/csye7374"
                    sh "docker build ./webapp -t ${env.DOCKER_HUB_USER}/csye7374:${env.BUILD_NUMBER} "
                    sh "docker login -u ${env.DOCKER_HUB_USER} -p ${env.DOCKER_HUB_PASSWORD} "
                    sh "docker push ${env.DOCKER_HUB_USER}/csye7374:${env.BUILD_NUMBER} "
                    
                }
            }
        }
        stage('Update Kubernetes') {
            container('kubectl') {
                sh "kubectl rolling-update csye7374-app-rc --image ${repository}:${env.BUILD_NUMBER} --image-pull-policy IfNotPresent"
            }
        }
    }
}