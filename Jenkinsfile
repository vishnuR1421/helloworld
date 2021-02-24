def app_name = "${project_name}"

pipeline {
    agent {label "test_label"} 
    tools {maven "mymvn"}
    stages {
        stage("git clone") {
            steps {
                git credentialsId: 'tejesh-github', url: "https://github.com/tejesh555/${app_name}.git"
            }
        }

        stage ("build") {
            steps {
                sh """
                    mvn clean install
                    echo 'this is for'
                    echo 'multiple lines'
                    """
            }
        }

        stage ("test") {
            steps {
                script {
                    sh 'echo "this is testing"'
                }
            }
        }

        stage ('publish') {
            steps {
                rtUpload (
                    serverId: "myjfrog",
                    spec: '''{
                        "files": [
                            {
                            "pattern": "target/*.jar",
                            "target": "skr-login/"
                            }
                        ]
                    }''',
                    buildName: "${JOB_NAME}",
                    buildNumber: "${BUILD_NUMBER}"
                )
            }  
        }

        stage ('deploy') {
            steps {
                sh 'echo "ansible -i hosts_file playbook.yml"'
            }
        }
    }
    
    post {
        always {
            emailext body: 'this is status of job "${BUILD_URL}"', subject: 'Job Status', to: 'tejesh2311@gmail.com'
        }
    }
      
}
