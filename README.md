# README

## Installation Requirements and Setup Guide

### Prerequisites:
- **Ruby**: The project uses Ruby version 3.2.3. You can manage multiple Ruby versions using 
a version manager like `rbenv` or `rvm`.
- **Rails**: The application is built with Rails version 7.1.3.
- **PostgreSQL**: Check that you have PostgreSQL installed and running.
- **Node.js and Yarn**: Required for managing and building JavaScript dependencies.
- **Bundler**: Used for managing Ruby gem dependencies. Install with `gem install bundler`.
- **ImageMagick**: Needed for image processing features in the app.

### Environment Setup:
Before starting the setup, ensure your environment variables are properly configured 
as outlined in `.env` or `config/database.yml`.

### Steps to Install and Run:

1. **Install Dependencies**:
Run the following commands to install Ruby and JavaScript dependencies:
 ```
gem install bundler

bundle install

yarn install
 ```
2. **Database Preparation**:
Load the database schema and initial data:
 ```
psql -U postgres -d er_project_development -f outputfile.sql

rails db:migrate

rails db:seed
 ```

3. **Build Assets**:
Compile JavaScript assets using Yarn:
 ```
yarn run build
 ```

4. **Start the Server**:
Launch the Rails server:
 ```
rails s
 ```

### Handling Server Crashes and PID Files:
If the server crashes and a PID file prevents restarting, try the following:
1. Delete the PID file located at `tmp/pids/server.pid`.
2. Restart the server.

### Troubleshooting:
- Check that all your prerequisites are correctly installed and accessible from your command line.
- Check that your PostgreSQL server is running before loading the database.