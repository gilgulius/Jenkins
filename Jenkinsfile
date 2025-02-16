pipeline {
    agent any

    parameters {
        string(name: 'MESSAGE', defaultValue: 'Hello from Jenkins!', description: 'Custom message for the report')
    }

    stages {
        stage('Set Default Message') {
            steps {
                script {
                    // If the MESSAGE is empty, set the default message
                    if (!params.MESSAGE?.trim()) {
                        env.MESSAGE = 'Hello from Jenkins!' // Set to default message if empty
                    } else {
                        env.MESSAGE = params.MESSAGE
                    }
                }
            }
        }

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/gilgulius/jenkins.git'
            }
        }

        stage('Run PowerShell Script') {
            steps {
            
                powershell "powershell -ExecutionPolicy Bypass -File script.ps1 -Message '${env.MESSAGE}'"
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML (target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '.',
                    reportFiles: 'output.html',
                    reportName: 'Jenkins Job Output'
                ])
            }
        }
    }
}
