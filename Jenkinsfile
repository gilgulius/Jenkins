pipeline {
    // Description: Define the agent that will execute the pipeline
    agent any

    // Description: Define the pipeline parameters
    parameters {
        // Description: Define a string parameter named 'MESSAGE' with a default value and description
        string(name: 'MESSAGE', defaultValue: 'Hello from Jenkins!', description: 'Custom message for the report')
    }

    // Description: Define the pipeline stages
    stages {
        // Description: Stage to validate the MESSAGE parameter
        stage('Validate Message') {
            // Description: Define the steps for this stage
            steps {
                // Description: Use a script to validate the MESSAGE parameter
                script {
                    // Description: Check if the MESSAGE parameter is empty
                    if (!params.MESSAGE?.trim()) {
                        // Description: Display a warning message if the parameter is empty
                        echo "⚠️ WARNING: MESSAGE parameter is empty. Displaying error in report."
                        // Description: Set the MESSAGE environment variable to a default error message
                        env.MESSAGE = '⚠️ ERROR: No message provided. Using default.'
                    } else {
                        // Description: Set the MESSAGE environment variable to the provided value
                        env.MESSAGE = params.MESSAGE
                    }
                }
            }
        }

        // Description: Stage to clone the Git repository
        stage('Clone Repository') {
            // Description: Define the steps for this stage
            steps {
                // Description: Clone the Git repository from the specified URL and branch
                git branch: 'main', url: 'https://github.com/gilgulius/jenkins.git'
            }
        }

        // Description: Stage to run the PowerShell script
        stage('Run PowerShell Script') {
            // Description: Define the steps for this stage
            steps {
                // Description: Run the PowerShell script with the provided MESSAGE parameter
                powershell "powershell -ExecutionPolicy Bypass -File script.ps1 -Message '${env.MESSAGE}'"
            }
        }

        // Description: Stage to publish the HTML report
        stage('Publish HTML Report') {
            // Description: Define the steps for this stage
            steps {
                // Description: Publish the HTML report using the specified settings
                publishHTML (target: [
                    // Description: Allow missing reports
                    allowMissing: false,
                    // Description: Always link to the last build
                    alwaysLinkToLastBuild: true,
                    // Description: Keep all reports
                    keepAll: true,
                    // Description: Report directory
                    reportDir: '.',
                    // Description: Report file name
                    reportFiles: 'output.html',
                    // Description: Report name
                    reportName: 'Jenkins Job Output'
                ])
            }
        }
    }
}