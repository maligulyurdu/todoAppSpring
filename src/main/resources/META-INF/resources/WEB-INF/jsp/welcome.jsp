<html>
    <head>
        <title>Welcome Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
            }
            .welcome-message {
                font-size: 24px;
                font-weight: bold;
                color: #00698f;
            }
            .name {
                color: #ff9900; /* orange color */
            }
            .manage-todos {
                font-size: 18px;
                color: #337ab7;
                text-decoration: none;
            }
            .manage-todos:hover {
                text-decoration: underline;
            }
            .suggestions {
                font-size: 16px;
                color: #666;
            }
        </style>
    </head>
    <body>
        <h1 class="welcome-message">Welcome to Login page <span class="name">${name}</span>.</h1>
        <div><a href="list-todos" class="manage-todos">Manage</a> your todos</div>
    </body>
</html>