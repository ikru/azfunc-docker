# Debugging Azure Funcion inside docker container

## Hints
- Run tasks
    - docker-compose-up-
    - func-watch or func-debug for azure function
- After running debug command
    - press F5 and select func process
    - call http url from CMD in browser

## Configuring an application Client Id and Client Key

- Go to <siteUrl>/_layouts/15/appregnew.aspx
- Generate Client (App) Id, Client Key, other fields put something
- Go to <siteUrl>/_layouts/15/appinv.aspx
- Put in created Client (App) Id, Click Lookup
- Populate Permissions request XML with
    <AppPermissionRequests AllowAppOnlyPolicy="true">
        <AppPermissionRequest Scope="http://sharepoint/content/sitecollection/web" Right="FullControl"/>
    </AppPermissionRequests>
- Give consent to Trust it

## VS Code
- Docker Extension
- C# Extension

## Docker configuration

- Enable volume sharing
