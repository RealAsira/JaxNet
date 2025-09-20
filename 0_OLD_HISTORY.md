# Project History (Before Git Was Being Used)

The workplace that introduced me to [EC:Pages](https://github.com/realasira/ecpages) (and subsequently resulted in the JaxNet project) used different methodology for version control (ie extensive backups and note-taking). Initially, this project utilized a more detailed version approach of this same methodology.

Now, the project is being moved to Git and GitHub, though it is also not being actively developed or worked on. However, it is still one of the largest, single projects I have worked on. Fairly extensive documentation has been kept, starting shortly after the foundation for the project was laid. This file contains said history, chronologically ordered.

## START OF HISTORY

### 9/19/2024

    moved documentation off of jaxnet knowledgebase and into this document.
    added descriptions and dates to all database objects as accurately as possible.
    removed server-side barcode generation as client side version was simply much better for jaxnet purposes.

### 11/21/2024

    added apr_oldNotifications_cleanup
      deletes notifications that have been both acknowledged (seen) and dismissed (no longer needed)
      runs daily with other automated procedures

### 11/14/2024

    obj_quickPanel's task list badge (not task+notifications badge) now counts number of incomplete tasks
    Corrected tab order for tDialogForm-footer buttons (tab onto left button then right button)
    Updated various LIKE queries to either be correct clause type (replace LIKE with something else), to be more accurate, or to use SQLKeywordsClause (if applicable)

    Added user.LEID and employee.LEID to user and employee global objects
    Styled notifications in the notification list (quick panel)
    Added dismiss and remind me later buttons for notifications

### 11/07/2024

    Nav menus
        futher improved logic for if "move item to top/bottom/category" dragTargets should appear or not
            just had a couple small kinks to work out from the previous improvement
    Can now drag to swap two items. Items must either
        both be root items
        both be nested items (regardless of level)
            ie cannot swap a nested item with its parent or with a root element
    still need to complete drag nested item to root top/bottom

### 11/06/2024

    Nav menus

    improved logic for if "move item to top/bottom/category" dragTargets should appear or not
        depends on number of items in the nav menu... too few and they won't appear since they can't be used
    can now move root-level menuItems to top/bottom of root
        still need to do the logic for moving nested items to top/bottom of root

### 11/05/2024

    ECPages logic complete other than access rights
    Improved dragDrop js functionality by passing act of the target element to ajaxPost (or dragDrop if none is provided)
    began work on pr_menuItems_swap
        can move a menuItem to a different parent
        everything else is still under construction

### 11/04/2024

    expanded script_draggableElements
        now includes toGenericID and fromGenericID
            for if dragged item or target don't have LTID/XID
                ie navMenu menuItems
        now sends fromLTID, fromXID, fromGenericID, ecid, loader, and act from the dragged element
            then toLTID, toXID, toGenericID is added from the target element, then posted to server
    Added "Move item to top" and "move item to bottom" boxes for aMenu-items in ecreport_navMenus
        allows items to be dragged to top or bottom of the menu
        need to add something similar for dragging an element into a parent
    Added obj_navMenu_dragReorder
        processes to/from data from dragged element and target
        currently ONLY returns a message with that data... ECPages logic and SQL are incomplete

### 10/31/2024

    can now have labeless input_entity
    can now edit or create navigation menus
        working on adding, editing, and removing menu items
    HTML is complete.
    Most of the CSS is complete too (just need light mode version).
    Add, edit, delete buttons are in place (so are the respective tDialogs/tComponents)
    Drag handles are in place but are functionless

### 10/30/2024

    dbo.shortcuts now uses LEID instead of LTID/XID
        related queries, procedures, and functions have been updated
        related console elements updated as well

    "Add Shortcut"
        can now search by entity description and a list is returned
            uses same logic and query as xinput_entity

### 10/22/2024

    created pr_notification_new
        generates a new notification using fromLEID, toLEID, and content
    created fn_html_anchor
        generates a basic html anchor tag using href and text
    modified pr_task_toggleCompletion to create notifications when a task is completed or "decompleted"

    task notifications
        assignee notified when they are given a task (by someone other than themselves)
        assigner notified when assignee completes or "decompletes" a task (if the assignee isn't themself).
        assigner, old assignee, and new assignee are notified when task assignee is changed

    quickPanel
        non-dismissed notifications (vw_notifications_quickList,) are now displayed below tasks (whether they are acknowledged/seen/read or not)
            not styled yet... no dismiss button yet
    non-acknowledged notifications are displayed in pop using xNotification function
        then they are marked as acknowledged so they won't appear in this fashion again

### 10/21/2024

    tComponent now has "placeholder" parameter.
        placeholder is a temporary value that is rendered in place of the object body in the event the "renderAfterPageLoad" param is set to 1 and a placeholder is provided. Otherwise the whole component simply renders after page. Placeholder is not rendered if renderAfterPageLoad=0 or when the component is actually rendered after the page is loaded
    updated quickPanel console button by setting obj_task_quantityBadge to renderAfterPage and use a "0" value quantityBadge while rendering

### 10/18/2024

    xHint bubble tail now appears, is correctly oriented/positioned for each mouseZone
    merged xHint's mouseZone styles for 4,7 and 6,8
        js still returns 4,7,6,8 as separate zones to clientPosZone variable
    refined mouse zone percentages
    xHint still now appears above all non-loader elements
        JS gets position and moves to body instead of xHintContainer... this allows z-indexing and absolute position to "float" above other elements. No more clipping occurs. Onmouseleave, the content is returned to the xHintContainer 

     clientPosZone ASCII graphic (updated default percents)
             _________________
            |    |       |    |
            | 1  |       | 3  |   0-20%
            |____|_______|____|
            |    |       |    |  
        y   | 4  |   5   | 6  |   20-85%
            |    |       |    |
            |____|       |____|
            | 7  |       | 8  |   85-100%
            |____|_______|____|
           0-10%  10-90%  90-100%
                    x


     clientPosZone ASCII graphic (mobile percents, screen<982px)
             _________________
            |    |       |    |
            | 1  |       | 3  |   0-20%
            |____|_______|____|
            |    |       |    |  
        y   | 4  |   5   | 6  |   20-85%
            |    |       |    |
            |____|       |____|
            | 7  |       | 8  |   85-100%
            |____|_______|____|
           0-20%  20-80%  80-100%
                    x

### 10/17/2024

    new global JS vars clientPosX, clientPosY, and clientPosZone are updated on page ready and mousemove
            clientPosX and clientPosY are the X,Y cords of mouse relative to the browser viewport
            clientPosZone is 1 of 8 zones that the mouse might be in.

    xHint now uses clientPosZone to set "mouseZone" attribute on xHintContent onmouseover. 
        mouseZone attribute is used to dynamically select css styling for positioning
        still need to add in bubble tail & appear above all non-loader elements

     clientPosZone ASCII graphic
             _________________
            |    |       |    |
            | 1  |       | 3  |   0-20%
            |____|_______|____|
            |    |       |    |  
        y   | 4  |   5   | 6  |   20-85%
            |    |       |    |
            |____|       |____|
            | 7  |       | 8  |   85-100%
            |____|_______|____|
           0-15%  15-85%  85-100%
                    x

### 10/15/2024

    fixed bug that prevent deletion of comments/messages

    IPAddresses (ipv4 and ipv6) are both stored as binary now
        fn_IPAddress_toBinary and fn_IPAddress_toString are used for conversions
        impacted ecs modules and sql procedures/tables are updated to correspond to the schema change
        hopefully this change also resolves the weird ACL bugs... will see in the coming days
            fixed query in vw_sessionsAndACL that prevented ACL sessions from returning

### 10/08/2024

    comp_contactCard now functions with email addresses
        for now, just using as additional email addresses
        will consider using "primary" email as user account sign in email
            for now, they are separate
        users cannot enter in alternate email addresses. Instead, they need to request it be added by an email using either their account email or phone call using their primary phone number. This may be changed at a later date.

    xHint font size/weight css bug resolved (was causing font to change size depending on what element contained it... now it is always consistent)

    tasks list in obj_quickPanel now shows "details" icon but never "edit" icon...
        instead, clicking on the memo/details icon will bring up edit or memo panel depending on access level

### 10/07/2024

    pr_contactXXX_checkIfPrimary procedures completely removed (xxx = address, phoneNumber, email...)
        replaced with query checking the primaryXXX ID from the contacts table
            if it matches the xxxID, then it is primary, otherwise it is not
        reflected necessary changes in comp_contactCards and page_account
    all contact data is now retrieved through the contacts table
        edit, new, delete functions reflect this change as well
    still need to implement email addresses part of the feature

    fixed bug causing "deleted" time clock entries to still be accounted for when determining if employee is clocked into task/work or not. Caused bugs in the quick panel in particular.

### 10/01/2024

    when the console quick panel is opened (on mobile), it now partially collapsed the console left navigation menu...

    just enough that the open/close button for the quick panel is visible but nothing else
    allows more space for the quick panel to be used on mobile devices specifically

### 09/26/2024

    created comp_contactCards

    replaces both comp_addresses and comp_phoneNumbers completely (both are deleted, and comp_contactCards called instead)
    adds new obj_contactCard
        can switch between phones, addresses, and emails (emails not implemented yet)
    still need to update the ECPages side of the schema to new dbo.contacts schema

### 09/19/2024

    ixed edit employee bugs
        1- couldn't edit due to pin issues
        2- couldn't edit due to missing ecs module error

    userGroups and "Access Rights To" reports - adding members or granting rights now automatically opens select entity sub-dialog
    "Access Rights To" report now only shows entities from the same website (mal-formed query prevented this before, but it was almost correct)

    Documents with override author name will now properly display the override name in the edit panel docAuthorName field (prevents accidental deletion and annoyance)

    websites can now edit their own settings
        root site (jaxnet) can edit its own settings/record info and others (because it is the root)
        other sites (e.g. full shift) can edit its own settings/record info but NOT others
            if nv(xid) when accessing websites console page, auto redirects to self (but only for non-root sites)
            if non-root sites attempts access to another website's settings, an error message appears and is logged

### 09/05/2024

    ACL sessions are now properly listed in ecreport_sessions
        GROUP by shows ACL sessions above regular sessions
        can filter on ACL sessions just like regular sessions
        can filter to show only ACL or only Regular.
        "Purge Access Control List" option is now only available if employee is viewing ACL sessions or All sessions (because ACL is displayed above regular sessions) ... otherwise option is greyed out with instructions to change view
            used new css var --greyed-text-color to achieve this in a universal way

    tasks now have views and logging is confirmed to be properly implemented
        ensured the views are being used on console_tasks and for obj_quickPanel
            created a special view for quickPanel tasks specifically, which is lighter weight that vw_tasks
    fixed timeClock bug preventing clock in if previous deleted entry didn't have an end time
    added idx_actionLog_date which was marked as missing in missing indexes query
        should improve lookup time significantly (one idx fixed abt 18 missing alerts)

### 09/04/2024

    fixed bug for .anchorify elements which ignored "target" attribute for javascript/anchorify hyperlinks
    updated status and beta pages to target _blank windows instead
    xQuantityBadge function now has class, id, and style params

    authentication for new, edit, delete time entries is complete
    marking task as complete now clocks out of it too
    response time issues
        not completely resolved, however, some of the task and time entry components now only load data when they are called (as opposed to always... was missing if state.is(refresh/respond) and if not(closed)
    created any missing views for time entries
    need to create missing views for tasks
    all logging is in place for both tasks and time entries

### 09/03/2024

    solved QPanel, timeEntries, tasks components refresh issues. All should now be working appropriately.

    final steps here:
        authenticate when creating, editing, or deleting a time entry
        ensure all logs and views are present for both timeEntries and tasks
        can then finish setting up projects utility and related tasks features

### 09/02/2024

    ecreport_timeEntries is now complete
        comp_timeEntries nearly complete...
            new, edit, delete timeEntries are all in place but still need validation feature
    Qpanel changes:
        Validation for if employee can edit task (button won't appear if they can't)
        If clocked into work, button now appears var(--notice-highlight-color) to indicate clock status
            This already applied to clocking into tasks
                refresh issue is still not fixed (these refresh issues are the next item to do for quick panel, tasks, and time clocking)

    console_websites
        can add, remove, edit cookieTag  for alt URLs
        now displaying cookieTag on website record page (and alt URLs)

    Still need to add a cookieTag checks... (instead of warning idea suggested in previous changelog)

    websites should cannot use cookieTags from other websites or their subdomains
        ie.
            siteA has cookieA
            subDomA (a subdomain of siteA) has cookieA
            subDomB (a subdomain of siteA) has cookieB
            subDomC (a subdomain of siteA) can use cookieA, cookieB, or a new cookie
            siteJ cannot use cookieA, cookieB. 
                cookieJ is assigned to it.
                cookieJ can now only be used for siteJ or its subdomains.

    Additionally, different dataOrgs should never be able to use any cookieTags reserved by other dataOrgs. 
        ie.
            dataOrg1 owns siteA and siteJ.
                dataOrg2 cannot use any cookies reserved for siteA or siteJ.

### 08/31/2024

    created contacts table
        references ownerLEID
        primaryShipAddressID
        primaryBillAddressID
        primaryPhoneNumberID
        primaryEmailID
    created contactEmaillAddresses
    changed phoneNumbers to contactPhoneNumbers
    changed addresses to contactAddresses
        for all of the above:
            updated ec:code
            update procedure names and table references

    for new contacts system:
        a contactID will reference (thru ownerLEID) a linkedEntity
            therefore, any entity can have contact information stored to it without altering its base table
            meaning, primaryXXXID can be removed from users, employees, organizations, etc...
        going to create comp_contactCard to replaces comp_phoneNumbers and comp_addresses
            addresses table, phoneNumbers table, emails table and procedures will be called from here
                will also create a table that allows all three to be toggled between (similar to employee time clock vs scheduling)

    modified websites table
        now has cookieTag (if null, parent's cookieTag will be looked up instead)
            allows consistent cookie names to be used
            allows diff sites to use same cookie (one sign in for many sites)
            allows same sites (diff sub domains) to use diff cookies (multiple sign ins, one site, eg. dev version could have different login)
        made most necessary changes in ec:code, procedures
            including new/edit website input for cookieTag
            need to do same for alt URLs
            need to disp cookieTags on website record page
            need to display warning message if cookieTag matches another website cookieTag

### 08/29/2024

    can now clock in and out of tasks
        this feature, like new, edit, delete tasks/time entries has reload issues in regard to quick panel and console_tasks page that still needs to be fixed

    updated pr_record_delete for tasks
        now also deletes time entries related to that task

### 08/26/2024

    significantly expanded placeholder for obj_newClockTime
        incomplete: 
            needs validation like edit and delete
            needs pr_timeEntry_new
    created xPrevWorkDay (sister fn to xNextWorkDay)

    improved ecreport_timeEntries
        better layout, better filtering
        input_trueFalse allowNull parameter is now properly enforced (wasn't before, this was a bug fix)
        if no employee filter, ec:loop will now add a tr containing employee name/hyperlink asHeader

    improved ordering of tasks
        completeDate null then 1 else 0 is now the first case statement
            makes sure that completed tasks are shown below the rest (regardless of any other factors)

### 08/23/2024

    comp_employeeClock
        renamed to comp_timeClock
        obj_editClockTime now handles editing of all time entries
        obj_deleteClockTime created to handle deleted (instead of responding in obj_timeEntries)
        obj_newClockTime placeholder to handle new direct insert time entries (as opposed to clock in/clock out buttons) ... only used to ecreport_timeEntries
        registered various components for dynamic refreshing

    ecreport_timeEntries 
        now can edit and delete entries
            both need authentication protocol
        references obj_newClockTime object
            incomplete/placeholder

    console_tasks
        mostly completed code for individual task record view (with link to time entries and logs)
        just needs to be made a little prettier

### 08/22/2024

    Added "View Time Entries" option on employee record page
    timeEntries report
        now shows which employee and/or task is filtered (header above the table)
        new, edit, delete buttons are now in place and only appear with correct access rights
            will need to filter on this in the dialogs as well though!
        correctly groups by the date of the time entry

### 08/20/2024

    Can now edit tasks
        Level of editability depends on if employee is assignee (least privilege), assigner (more), or has task edit access rights (full edit). Highest level of these three determines how much they can edit.
    Can now toggle task completion state (only if you are the assigner, assignee, or have edit rights).
    Quick Panel open button quantity badge is now quantity of incomplete tasks instead of random(9)
        This loads with the page and refreshes whenever the quick panel refreshes

 

    Created ereport_timeEntries. Incomplete but coming along.
        filter for an employees work time clock (t/f only, no null)
            if true, will hide tasks
            if false, will show tasks
        GROUP BY taskID then employeeID for additional sorting

### 08/19/2024

    employee time clock procedures are now pr_timeEntry_xxx
        and modified to handle both task and time clock time entries
        checked to ensure all functionality is still present for time clock (it is)
        next: implement remaining clocking server code for tasks

    Console Tasks:
        added "Projects I Lead" and "Ongoing Projects" and "Task Time Entries" to right options menu
        view details button appears always now... with memo appears as yellow instead of blue
        can now create tasks
        tasks now appear yellow if due today and red if overdue

    CSS Bugs:
        right options menu icons vs anchors colors were opposite, and would transition opposite, of each other when hovered.
        right options menu buttons icons wouldn't highlight unless directly hovered over (even though they should have highlighted when the button was hovered)
        button colors were odd on hover... prevented change for dark mode and corrected for light mode

    created function in lib_dataFunctions called xNextWorkDay([fromDate])
        fromDate (or today if null) is used as the starting point from which to determine what date the next workday is (mon, tue, etc... doesn't account for holidays)

### 08/16/2024

    obj_deleteRecord
        now has recordLTID param (uses LTID if null)
        now has callback param (redirects to console LTID list if null)
        associated procedure has section for projects now
        associated procedure has section for tasks now
            also deletes predecessor tasks

    tasks table
        removed "priority" column
        priority is sorted in the order by clause
            tasks list console page has option to sort by priority via order by clause
            quick panel task list always sorts using this order by clause

    tasks lists
        can now view details (and memo) from both quick panel and console list

    action logs
        view log details now has a title and uses "close" button instead of "cancel"

### 08/15/2024

    obj_deleteRecord now accepts recordXID svr/param
        if null, it will use the XID
        typically, XID is used but sometimes it can't be (ie, there is no XID)
        still need to add recordLTID param in a similar fashion
    several exception templates updated to word-break any overflow-wrap on the body (prevents especially long URLs from overflowing the page)

    comp_tasks created
        houses new, edit, task clocking, task completing objects
    console_tasks significantly expanded
        still need to program a lot of the actual features, but placeholders exist for most

### 08/14/2024

    Fixed a bug in lib_requestProtection that was causing violation causers to not go to CAPTCHA.
    Modified ACLRisk.add() for malicious apps by putting it into a function (isMaliciousApp) instead of repeated if statement... is far more robust this way and can easily be reused
        made this slightly more aggressive as well. If apps are programmed later that cause this to trigger when it shouldn't anymore, a bypass can easily be programmed in

    Updated pr_xxx_getData procedures to table valued functions
        Made sure, throughout the database, that calls to tbl val funcs has "dbo." prefix to differentiate them from regular tables (which also never use a tb_ prefix)

    Created new table "timeEntries"
        replaces employeeTimeClock
            new columns in timeEntries "isTimeClock" and "taskID"
                isTimeClock = 1 AND taskID = NULL     OR     isTimeClock = 0 AND taskID = [int]
                    only one or the other
        to be used for both employee time clocking of work and tasks
            employee time clocking is completed (including quick clock in quick panel)
            no way to clock in or out of tasks yet (will be in quick panel and on tasks console/project pages)

### 08/12/2024

    created the projects and tasks table
        projects is just a placeholder for now, to come later
    looping through tasks assignedToEmployeeID on quick panel
        related features are all incomplete currently
    added quick clock in if you aren't clocked in (won't show hours, etc...)

    It is worth nothing, none of the buttons (except view task list) are incomplete and non-functional at this point in time. There placeholder buttons as the layout is revised and the database/server framework structure is built for said features.

    updated titlebox to accept hintContent param ... this adds a hint next to the title
        previously, hints were contained with the title. This caused issues with the title of the titlebox being used as the ID of the titlebox if no ID was provided... the hint, and its content, would become part of the titlebox ID.
        updated titlebox hints throughout the console to accomdate this change (only a few changes needed to be made)

### 08/09/2024

    revised console notification menu

    cleaner layout (separate titleboxes instead of combined table)
    responsive width/max-height depending on screen dimensions
    list of clocked in employees complete
        quick switch login is not
    opening the menu initially loads it and subsequently refreshes it
        closing it does nothing

### 08/08/2024

    Employee button now pops out a menu for notifications, tasks, and quick switch to another clocked in employee
        none functional yet
        added icons to create new task or view task list report
    fixed css bug in index_css (top row of table wasn't staying unhighlighted like it was supposed to)

    created new js function toggleOpen('[elementID]',[callbackOnOpen],[callbackOnClose]);
        toggles the class "opened" on #elementID
        on open, callbackOnOpen is fired if provided
        on close, callbackOnClose is fired if provided
        used this function in the few places where this type of toggle was manually written

### 08/07/2024

    modified employee clock to have a button to toggle between scheduling (not implemented) and time clock
    employees now have a pin for quick sign in/switch accounts
        pin number is automatically generated but the employee can change their own pin
        any 4 digit number

    entityGroups have been renamed to collections
    fixed linebreak bug in tinymce editor
    began working on employee button to bring up clocked in employees, tasks, and notifications

### 08/01/2024

    bcGen.js is now considered complete
        changed var to let and const

    entityQueue product SKU is now actually the SKU if applicable
    quick scan to entityQueue complete

    console module now passes obj_barcodeResponder to ecreport module .asReference
        ecreport module is a subset of console and should be treated as part of the same module as much as possible
            passing obj_barcodeResponder allows ecreport children module to use obj_barcodeResponder in grandparent module as if it were just in the parent module
                allows for use barcode scanning (eg in entityQueue or other reports)

    console search bar/button expands on focus, giving more room to type. off focus brings barcode button back into view.

### 07/31/2024

    refined lib_printing dimensions in xPrintPage so 80/page and 30/page labels are correctly aligned
    entityQueue - universal, product, and bin label layouts (80/page and 30/page) are complete
        need to replace SKU with the actual SKU for prod_80 and prod_30

### 07/30/2024

    prototype for lib_printing script is finished
        need to complete actual print page layout
        need to test callback (but it hypothetically should work)
    removed .ajaxClick from .printDialog elements because it was attempting to fire ECID through ajaxClick and printDialog functions (only printDialog is needed)
    comp_input_entity now uses entityName_public with isNull backup to entityName (uses public name if available, just for the console to appear cleaner)
    fixed a css bug in lib_pageTemplates which squished employee name to wrap around on left menu bar instead of displaying in one line

### 07/29/2024
  
    created lib_printing

    rough prototype for ajax prints, etc...
    using in entityQueue to test label printing

### 07/26/2024

    c128c barcodes generate successfully!
    EAN13 barcodes generate successfully! (Including UPC-A)

### 07/25/2024

    Everything is in place to generate the barcodes. Just need to do the actual barcode generation now.

### 07/24/2024

    highlights can now have ec-code written inline

    added whitespace around the outside of the API_serverBarcode generated barcodes (white space is required in order to read the start and end of codes, and forcing it to be included is a good preventative measure to take to ensure that space is always there)

    started working on bcGen.js - the JS render engine for barcodes. Will utilize ec:barcode1 which sets a div with a class (jsBarcode), val, and symb... will utilize those to generate the barcode via JS.
        successfully gets value and symbology data from .jsBarcode elements. Adds these to a Set as objects. Each is unique. Then loops over each of them to either render or retrieve an svg value which is used to update each .jsBarcode div with the val.
            later, the val put inside the .jsBarcode divs will be the barcode svg (this part still needs to be coded)
            because rendered barcode svgs are stored, the function can be easily reloaded to get more barcodes without rerendering every single barcode. 
                every time the webpage is refreshed, the function and stored data is reset.

    created ec:barcode2 which utilizes the server side rendered barcode
        perhaps this can be upgraded in the future by storing svg data in a data object just in case the same barcode is retrieved multiple times (e.g bulk print of one label only requires on render, just needs to retrieve it multiple times)

### 07/23/2024

    created API_serverBarcode ... stated by using my old xxx_lib_barcodes from work

    changed procedures to functions, added svgs widths/heights/viewbox
    will only use this for unsecure server rendering/API service (ie., rendering one of our barcodes for someone else to print).
    plan to use a client-side renderer for secure server transactions (ie., rendering barcodes en masse for printing labels, etc, from the console or other employees utilities)

### 07/16/2024

    finished xInput_barcode, tBarcodeResponder (obj_barcodeResponder), script for barcode scans

    need to thoroughly test everything but brief initial tests look good!
        can't test thoroughly until render engine is complete and physical barcodes can easily be generated and printed for testing

### 07/1/2024

    updated fn_entityBarcode_decode to tb_entityBarcode_decode because it is a table valued function
        now looks up products via UPC/EAN13
        now looks up shipments via referenceNumber (barcode/tracking)
        placeholder for codabar/c128a/b/c39 created. I don't know if they'll ever be used but a spot for them exists just in case

    barcode encoding and decoding were previously using LEFT 4 of LEID as check value. I modified it today to use RIGHT 4. Updated previously dev log to say right because I may refer back to it in the future to troubleshoot/debug/further develop/refresh, etc...

    created shipments table so tb_entityBarcode_decode could lookup references.
    started working on lib_barcodeScanner

### 07/10/2024

    dbo.fn_entityBarcode([LTID],[XID])
        returns universal barcode
    dbo.fn_entityBarcode_decode('[barcode] AS STRING')
        returns LTID, XID, LEID, barcodeVal
            doesn't return LTID, XID, LEID if it isn't a universal barcode. Instead returns just barcodeVal

    Universal barcodes are encoded as follows:

    1. XID is multiplied by 256 to prevent overlapping barcodes when LTID is added in (TINYINT)
    2. LTID is added to computed value from step 1
    3. RIGHT 4 digits of LEID are appended to value from step 2 (with prepended 0's if LEID len is < 4)
    4. 0 is prepended if quantity of digits in barcode is not even (c128 symb requires even number)

    Decoding is in essentially in reverse, with RIGHT(4) of LEID use as a check:

    1. right 4 digits are removed.
    2. result is divided by 256 and cast as int (removes decimals places which represent LTID) and stored as XID
    3. result of step 2 is subtracted from result of step 1 and stored as LTID
    4. LEID is retrieved using dbo.fn_linkedEntity_getID() using LTID/XID from steps 2 and 3
    5. RIGHT 4 digits of LEID (with prepended 0's if LEID len is < 4) is compared to right 4 digits of unaltered barcode. If they match, the barcode is considered valid. Otherwise, it is a generic c128 code (LTID, XID, LEID aren't returned by original barcode is)

    Next step is to add xInput_barcode which will always post via ajax for the server to process. ecid and loader are passed as params.
    Also need to add UPC/EAN-13 decoding to dbo.fn_entityBarcode_decode
    Also need to add track number look up if universal barcode decode returns invalid (looks up shipments with matching reference)

### 07/08/2024

    entityGroups bug fixed. At some point edit dialog had memo (SEO description) was removed.
    Setup entityGroup description to be the SEO description. Will later remove the content from the page, but keeping it for now (debugging, etc...)
    "View on website" now goes to /home for the root group.
    if /store/name-of-root-group is used instead of /home, all of the homepage contents will show anyway.

    fixed bug in xinput_textArea that caused hintContent to misalign

### 06/26/2024

    shipBox record page (can now see individual boxes)
    create, edit, "delete" shipBoxes  now functional
        "delete" marks as inactive and add "no longer used" in the title
            not actually deleting to preserve shipment records

    created fn_shipBox_estimatedWeight(materialID,L,W,H)
        estimates a box's weight based on its material, length, width, and height
            calculates using surface area and poundsPerSqFt in shipBoxMaterials

    created vw_shipBoxes, vw_shipBox, vw_shipBox_select and vw_shipBoxMaterials

### 06/24/2024

    created shipBoxes and shipBoxMaterials tables

    began populating with a few "custom" boxes
    list view is working and complete
    need to finish record view and associated functions/procedures

### 06/21/2024

    Created label queue

    need to finish printing and quick scanning to queue

### 06/20/2024

    set paste_data_images to false in tinymce
        prevents blob images from being allowed. these were causing severe render issues due to TCP and QUIC being unable to handle the blobs at times. images can and should be handled differently.
        this also means employee notes can no longer accept image blobs.

    added breadcrumb snippets (https://www.semrush.com/blog/breadcrumbs-for-websites/) see breadcrumb schema script...
        used by google and other search engines for SEO... plus, it makes the clickable link on the SE look cleaner
        will need to do this later for entityFamilies on the customer facing part of the site
            I did all of this for the console side (testing and debugging purposes, will keep) and on public facing documents

    Replaced instances of IDENT_CURRENT() with SCOPE_IDENTITY() through pr_xxx_new procedures.
        IDENT_CURRENT() returns current identity of table, regardless of sessions
            ie, if two operations on notes are made at the same time, the wrong identity might be selected sometimes
            not noticeable with only one person using the database, but I expect many people to use it simultaneously
        SCOPE_IDENTITY() will return last created IDENTITY column, with respect to the current sessions
            ie, if I insert a new note at the same time as someone else (or 5000 other people), the correct identity is returned because it is the last generated identity made during the session I created the note

### 06/12/2024

    fn_entityImage() now requires a second param, which is imageTypeID
        updated all calls to this function to reflect this change
    created pr_entityImage_edit to create and edit entityImages
    create apr_entityImage_cleanup to delete old images daily
    obj_entityImage_edit called from console entities and on edit user profile
    everything is working as expected
        except on live server the physicalPath isn't returned from pr_entityImage_edit... but is on the test server??

### 06/07/2024

    Updated fn_entityImage to use LEID instead of LTID and XID
        also updated calls to fn_entityImage to support this change
        now functions as expected. attempts to find physicalPath from entityImages. If it can't find one, it'll use the linkedTable iconURL instead.
        also updated views, etc to use fn_entityImage instead of iconURL. This means everything is ready to go for coding obj_entityImage_edit now.
    created imageTypes table which stores a description tag, dimensions
    entityImages table now stores LEID, path, imageTypeID, and deleted fields

    I accidentally dropped the fn_entityName function while working on fn_entityImage ... I discovered that my backups were not being created in two separate places. Instead, they were being striped across two files! I fixed the backups to make two separate backups and they are now working correctly.
        I was able to restore the function by using both of the backups in tandem in the SSMS restore database wizard (restored to different server, scripted the dropped function as create)... would have been bad if I only had access to one of the striped files though. Now, each file can be used independently to restore (tested!)

### 06/06/2024

    corrected bug in tb_user_riskAssessment (now correctly recognizes if part of the last/first name is in email)
    created various views to replace "FROM dbo.[table]" statements (improved security, efficiency, readability)
        vw_userGroups & vw_userGroup
        updated vw_widget & created vw_widgets
        vw_websites & vw_website
        vw_employeeNotes

### 06/04/2024

    created various views to replace "FROM dbo.[table]" statements (improved security, efficiency, readability)
        vw_documents & vw_document
        vw_kb_records & vw_kb_record
        vw_actions
        vw_employees & vw_employee
        vw_users & vw_user
        vw_sessions
        vw_ecreports (index of all ecreports)

    Remaining files (ctrl+shift+f: "FROM " (match case)):
        console_
            entityGroups
            highlights
            linkedTables (especially the sys. queries)
            userGroups
            websites
            widgets
        lib_requestProtection
        page_status
        page_store

    marginally improved designated end time time clock refresh system
        at least 30s between refreshes now

    NOTE: at some time around 06/04 most views not listed were also created.

### 06/03/2024

    created various views to replace "FROM dbo.[table]" statements (improved security, efficiency, readability)

    vw_website_idents
    vw_addresses
    vw_countries
    vw_territories
    vw_employeeTimeClockEntries
    vw_phoneNumbers
    vw_widget
    vw_asset & vw_assets
    vw_organization & vw_organizations

### 05/31/2024

    I'm unsure what caused the issue reported 05/30/2024. I spent a good few hours trying to troubleshoot it and instead rewrote the javascript to be more efficient and, apparently, to cause ECPages to return correctly.
    Image uploads are now working as intended. 

    Still need to test button mode vs drag-drop mode ...
    Need to style both of the above
    Need to program default handling of files uploaded (ie, files ultimately HAVE to be deleted if they aren't being intentionally stored somewhere else)

### 05/30/2024

    images are successfully uploaded, handled, and data returned by ECPages.

    HOWEVER, I had to manually set the output for ECPages ... it should do this automatically... have to investigate the difference here...

### 05/29/2024

    employee preferred name is now just the first name.
        the one spot it needed a last initial now retrieves that from the user last name
    viewing a session report now also has links to view IP activity or session activity

### 05/28/2024

    added employees.preferredName column
    now the employees preferred name is displayed on their console, on the list employees view, and employee page view.
    When employee public facing profile is visible to other users (e.g. comments section), the employee's "users.displayName" is used (unless null), then employees.preferredName (unless null), then users.firstName LEFT(users.lastName,1) is used.

### 05/15/2024

    slightly modified lib_requestProtection to work better
    began working on the ability to upload images
        entityImage table stores image path (only for entityIcons, will later create an "images" table for more robust use)
        working on image upload form
            currently it successfully submits via ajax. client-side JS is hypothetically complete.
            server successfully processes the image according to the ecid, act, etc...
            server fails to actually respond to the ajax request with more than @null

    dbo.fn_entityImage() now returns url from entityImages table if it is available for the LTID/XID combo. If not, it will use the default icon url from the linkedTables table.
        employee image will attempt to retrieve the user image if an image isn't assigned to the employee

### 05/10/2024

    created input_numberRange
        similar to date range, but without jquery dialog... used for inputing floats/ints instead of dates
        validates number order, etc
    added various inputs to beta page for testing
        added inputmode attributes to various inputs to improve mobile experience

    fixed css bug that caused input_dateRange2 and _numberRange to display funky on Safari
    highlights now group by type, end date, start date, id; and order end date, start date
    added br after p class notice on console settings so changing a setting wouldn't upset the whole page when the message was populated

### 05/09/2024

    merged input_dateRange1 and dateRange2

    uses dateRange2 if nulls are allowed
    uses dateRange1 if nulls aren't allowed
    restyled dateRange1 to appear significantly more visually alike to dateRange2
    added dateRange input to highlights filters/inputs as null values are now allowed

### 05/08/2024

    created input_dateRange2

    similar to previously created dateRange with a few tweaks
        can do all the things dateRange can do
        can also select an end date with a null start date (unlike dateRange)
        each date is independently selected instead of selected together
            might not be as fancy at first look, but overall more powerful, still looks superb
        doesn't submit daterange_text svr/param, which is useless without parsing and redundant when parsed.

### 05/07/2024

    updated inputs _ssn _tel and_zip
        they autoformat based on the length
        e.g. +1 (435) 755-0486 vs 755-0486  OR  84321 vs 84321-0000
        ssn = 123-45-6789
        SQL functions ssn and zip _formatted now exist (like previously existing phoneNumber_formatted)
            all three strip non-numeric characters and reformat to guarantee accurate data

    created input_daterange (can be null, start date only, or start and end date.)
        Put this all over the console
            The one drawback is you can't select an end date but no start date...

### 05/06/2024

    fn_session_aclScore created (instead of manually retrieving the aclScore every time, there is now a single function for it)
        reflected above change in console_users and ecreport_sessions

    created tb_userAccount_riskAssessment (will very likely need to balance this in the future)
        does what fn_userAccount_assessRisk was going to do, but returns line by line what/why the score is
            created associated ecreport (19) 
                also added hyperlink to assess phone record via search people free
        renamed fn_userAccount_assessRisk to fn_userAccount_riskScore
            retrieves the summed score from tb_userAccount_riskAssessment
        added emailed validated (x) or (✓) mark to user account and risk assessment page

    created dbo.fn_phoneNumber_formatted(phoneNumber)
        accepts phoneNumber as param, strips non-numeric chars, then formats it depending on it's length.
            if incorrect length, only numbers are returned (improper format entered)
            if len 7    xxxyyyy         =>  xxx-yyyy
            if len 10  aaaxxxyyyy   =>  (aaa) xxx-yyyy
            if len 11  caaaxxxyyyy  =>  +c (aaa) xxx-yyyy

    changing password from user account settings now validates the password rules.

    organization console records now displays number of members (with hyperlink to view)
        can now create an asset form the org console record
            surprisingly, this was basically finished... not sure why it wasn't before

### 05/03/2024

  Regarding user records (inactive/isbanned/accountRisk):

    Only employees with level 5 access rights to employee profile can mark an employee's user account (and subsequently their employee account) as inactive, banned, or change their risk.
        These fields are hidden if an employee has L4 access to user but less than L5 access to the linked employee record.

### 05/02/2024

    can now edit ban status on an account.
        if banned, account must be inactive (this is forced on client side and server side)
        if not inactive, account cannot be banned (this is forced on client side only)
            if marked as banned, account inactive is overridden to true as the default behavior
        if banning an account, a note is added to account
        if unbanning an account, a risk alert is logged
    can now edit account risk level

    improved tDialogForm to include forceContinue param (requires input before the dialog will close, including esc button)
    fixed double render of console contents (noticed when notifications started duplicating)... @iv(@contents) changed to @iv(@contents.asReference) so contents don't have to render and are instead only checked to see if it exists.
        did the same for aclProfile in logError

    added to various xinput_xxx's that were missing it.
    added cog-refresh icon
        used to compute account risk button on edit account dialog
            uses computed rank and assigns it as value for the input. user can still change it.

### 05/01/2024

    Inactive user accounts can no longer be signed into.
        User is prompted to contact customer support to reactivate their account instead.

    Added emailValidated, accountRisk, and isBanned columns
        emailValidated will be used to mark an account email as confirmed
        accountRisk will be used when signing up to determine if an account is risky and needs to be manually confirmed by customer service.
        Admin account with new websites is automatically emailVerified=1 and accountRisk=0
        can filter isBanned and isVerified on ltid=1
        a count of accounts needing verification (but not banned) appears on /status now

    account pr_user_signup now returns errorMessage, instead of various userIDs, to represent if an error occurred. Changes to sign-up reflected on /signup and /console?ltid=1

    added fn_userAccount_assessRisk
        not finished. currently returns 0 risk no matter what
        if risk is >= 100, account marked as inactive and a notification appears informing employee the account needs verification.

### 04/26/2024

    renamed productVariations to productVariants
    fixed bug in .ecs module related to pr_product_edit that caused "un-ticked" allowReplies box to return as null instead of 0 to the procedure.
    fn_searchedItems_keywords updated to include keywords for products and variants.
    fkeywords for products now uses a new fulltext index to lookup by keywords
        also created fulltext index for productVariants
        need to use this search field to return products that are also related to the variant keywords

    globalized xUpperFirst function because it wasn't global and therefore not usable.

    obj_variant_new created ... validates employee's accessLevel to create variant. The hide/unhide all and new variant buttons also run through validation and won't appear if the employee can't perform these actions.
    obj_variantsHidden_toggle is created and functional using pr_productVariants_markHidden and unmarkHidden

### 04/25/2024

    can now edit products (pr_product_edit)
    dbo.fn_productVariation_count created (returns number of variations a product has)
        added variation count to product list view
        added variation count to product record view
    created comp_input_tariffCode to select tariff codes for products

### 04/24/2024

    Can now create new products (pr_product_new)
    List view for products put in place. Semi-functional. Several features depend on product variations and are incomplete for now.
    Product record page put in place. Semi-functional. Several features depend on product variations and are incomplete for now.

    need to create pr_product_edit next.
    need to finish input_tariffCode (placeholder created) ... input_select doesn't work because 37k records is far too many for either the server or client to handle.

### 04/23/2024

    renamed products to productVariations and productSets to products
        will use products as the base product with variations used to tie unique attributes and pricing to them
    added tariffCodes table to database
        imported all 2024 tariff codes
    added products and productVariants tables.
    added productAttributes and productAttributeValues and productAttributesApplied tables
            will be used to tie productVariations to attribute values. 
            will set up so Cx can filter on attributes
            will set up so Cx can select variation on the product listing

    added console_products.
        placeholder new and edit dialogs.
        placeholder form in place.

    updated linkedTables console record page to correct FK list
        previously showed the FK column as the PK of the foreign key.
    created xQuantityBadge function
        simply shows a number on a small, inline badge

### 04/19/2024

    addresses and phoneNumbers now use LEID instead of LTID/XID. 
    updated procedures and tables to match
        added ownerLEID and dropped ownerLTID and ownerXID for each table
        updated pr_address_checkIfPrimary
        updated pr_address_new
        updated pr_address_edit
        updated pr_address_delete
        updated sp_address_new
        updated sp_address_edit
        updated sp_address_delete
        updated pr_phoneNumber_checkIfPrimary
        updated pr_phoneNumber_new
        updated pr_phoneNumber_edit
        updated pr_phoneNumber_delete
        updated sp_phoneNumber_new
        updated sp_phoneNumber_edit
        updated sp_phoneNumber_delete
        update pr_record_delete
            delete addresses and phone numbers by LEID instead of LTID/XID

    still need to change employee shortcuts to LEID instead of LTID/XID. Possibly searchedItems as well?
        searchedItems was already complete. Employee shortcuts may be more efficient as are.

### 04/18/2024

    added password rule validation
        one uppercase, one lowercase, one number, one symbol, 6-20 char length.
    tweaked sign in and sign up screens layout
        larger headers, space above headers, added password rule hint

    shrunk xHintContainer from .85 scale to .8 scale to fit in more places better.
        added 1.06 scale factor to xHintContent to offset shrunk container

    added user.sessionID in hash keys for download links and widget verification

### 04/17/2024

    created pr_websiteSetting_edit

    website settings are now editable
    new settings are stored (unless default setting, then they aren't stored)
    old settings are edited to supplied value or default value if user input is null/blank
        default value kept, instead of deleting setting record, to indicate there was a previous value at some point. Also easier on indexing since this table is read heavy.

### 04/16/2024

    website settings edit dialog is now complete for each settingType
        still need to create pr_websiteSetting_edit
    dbo.websiteSettings.websiteSettingValue no longer allows NULL values
        edit procedure simply will not create a record if NULL is provided. If provided value is changed to NULL, the record will be set to the default rather than deleted (indicates a previous non-default value was used at some point).

    xinput_url now accepts placeholder parameter.
    fixed tDialogForm.close() function's closeAfterRender param always returning true bug

### 04/15/2024

    retrieved data for websiteSetting values in edit pane (including default value if a value hasn't been assigned).
    tDialogForm.close() function now accepts closeAfterRender parameter, which delays closing by 550ms without removing content.

### 04/12/2024

    ACL Sessions are now deleted daily (unless black listed).
        This will keep the table clear of stale IP Addresses and enable users to use the website the following day without immediately being challenged by a CAPTCHA.

    Added closeAfterRender param to @close() function for tDialog
        allows dialog to close after it has been rendered. This results in the dialog appearing to open then close immediately afterward. Will likely use for errors (ie, failed to provided enough information to edit a setting).

    Added obj_setting_edit to console_websites. An error notification appears if there is insufficient parameters to edit a setting. Otherwise, settingID, settingTypeID, tag, and siteID appear. Will use this section to provide the actual edit dialog for each setting.

### 04/05/2024

    websites page now previews bottombar and topbar icon settings as they are stored
        added edit button for the above settings. Currently non-functional

    Clear Cache Button Changes:
        moved clear cache buttons to top of page
        set settingsMessage to be incline with clear cache buttons
        above changes only apply to website record pages, not console options page

    tweaked xHintContent to be slightly lower, to provide better visual aesthetic when it is placed at the top of topbar_content or bottom of displayBox

    Add/Edit/List Alternative URLs titlebox now has hints about the domain/subdomain input field.

### 04/02/2024

    Moved website settings to the website page exclusively.

    Each setting can now be seen but not edited yet
    Clear website and database session cache buttons on both website record and console settings for admins

    Added default values for site settings
    Made cookie names unique to the website again to prevent cross-site logins

    this was set up 11/6/23, changed 11/30/23, and reverted to 11/6/23 implementation on 4/2/24.

### 03/22/2024

    Added ability to purge ACL from sessions report.

### 03/15/2024

    added websiteSettings and websiteSettingTypes tables.
        "Types" used as title and descriptor of a setting
        websiteSettings used to store the values.

    ECPages now calls settings for website once, immediately after user settings. These settings are stored in a data structure referenced by a global variable (siteSettings). siteSettings can be called the same way as userSettings.

    changed bannerSrc to bannerIcon in xTopbar
        added topbarIcon setting into siteSettings and set it as the bannerIcon across files. Seems to be working correctly. Will take backup and leave up on site for a couple days. If it still seems to work will, I'll set this up with bottombar as well. Following this, I'll set up a way to edit these global settings for website admins on the respective website console record and on the console settings page.

### 03/08/2024

    Added placeholder .ecs modules for suppliers, priceTokens, saleCodes, purchaseOrders, bills, shipments, shipBoxes, orders, emailChains, emailTemplates, ledgerTransactions, bankAccounts, bankTransactions, payrollReports, payrollEntries, and reconciliations.
        Added linkedTable records for all of the above items as well.
        these all currently throw an errors like products and product sets, as they are incomplete.

    Added placeholder ecreports for financial statements and procurement plans
        these currently show a notification that the page is incomplete and not to use.

### 03/05/2024

    updated xHint to center text above hint container instead of to the right.
        should reduce clipping off screen
        also added arrow on bottom and fade transition
    added spacing above login / sign up box to improve page layout
    var offlineMode used to determine if website is online or offline
        allows console, index-css, index-js, and status page to remain online during maintenance (with warnings)

### 01/25/2024

    fixed icons for bills, POs, orders, shipments, and procurement plans
    console.ecs module has placeholder comments for various console pages such as sales, POs, emails, ledger...

### 01/24/2025

    Removed console left nav sub-menus
    Added menu items for financial statements, bank accounts, reconciliations, transactions, and payroll
        also added bills, POs, orders, shipments, and procurement plans (need to work on icons)

### 12/20/2023

    used sqlstr and sqlesc throughout console modules to filter inputs
    fn_accessLevel was using my userID and employeeID instead of passing the client's userID and employeeID
    removed .alt(0) from @websiteID throughout the console, included it once in _onRequestStart
    ensured .asInt or equivalent was used throughout the console

### 12/13/2023

    Security patch
        login/signup maxlength for email is now 255
        login/signup maxlength for passwords is now 32
        iframes are now restricted to sameorigin via two response_customHeaders and metatag
            exception is the widget API, which can display on any website
    new user count on status page now only includes active users registered on the same date

### 12/07/2023

    began implementing changes in ECPages SQL statements to defend against injection attacks

    e.g. @sqlstr, @sqlesc, and .asInt methods

### 12/05/2023

    used input_entity instead of input_number for parentIDs (new employees, entityGroups, KB, Docs)
    modified docURL in page_documents and lib_pageTemplates to allow for URL ending "/" character
    made ipAddress into link to sessions report on alert, error, risk, and all logs reports

### 11/30/2023

    finished console master search
    finished fn_searchedItem_computeRank

    corrected menu bug on home page, store page, and documents page that made so the "logout" button always showed even when logged out (and made so login showed when user was logged out).
        with this, the account specific menu items now only show when logged in.
    changed the cookie name to always be "clientCookie" and the host value is set to the specific host the user is logged into (in hopes of helping clear out various login/session bugs)

    corrected various css bugs and styling issues
        synced index_css with _dark to make sure both were up to date.

### 11/29/2024

    finished setting up dbo.searchedItems and dbo.tb_searchedItems
        this includes all peripheral procedures and functions other than dbo.searchedItem_computeRank
    dbo.searchedItem_computeRank has a placeholder function that returns the value of searchRankFactor from linkedTables
        this needs to be finished to calculate a weight based on number of recent views, creation date, refresh date, and LT search rank factor
    xinput_entity is successfully using tb_searchedItems to return results!

### 11/21/2023

    comp_masonry created
    masonry applied to highlights
    entityGroups must have a unique name on their website now
    messages actions (e.g. edit) restricted to OP (which they already were), employees (which they already were), but only employees with proper access level (new)

### 11/17/2023

    user settings account page set up
    modified procedure data objects by using .asXXX methods to ensure correct data types (e.g. .asInt and .asBool)
    changed .xHintContainer back to display absolute instead of sticky because sticky caused the hint content to clip off (overflow-y)

### 11/16/2023

    determined /store app will work similarly to documents... /store/tee-shirts will point to the "tee shirts" entity group by name. Therefore, each entity group must have a unique name.
    added View on Website link to console_entityGroups

    added rootApp var in _onRequestStart_ect ... used to get the base application (e.g. /store/tee-shirts becomes /store)
    further configured page_store to add child entity groups and highlights for the page.
    added right menu on home page and store page
    moved styles for entityGroupBanner out of inline styles into index_css and _dark

    added the ability for users to comment on documents (allowReplies column)
    added links to navigate back and forth between website home/store and docs/forums

### 11/15/2023

    entityGroups can now be created, edited, and deleted.
    entityGroups now display on the home page.

    hid document siblings from document console record view.
    deleting KB, doc, bin location, or entityGroup now causes their children to be adopted by the deleted record's parent (i.e. the child's grandparent)

    highlights can now be deleted.
    can add or edit a highlight to display on a specific entityGroup (or null for employee bulletin/site home depending on highlightType)
    new filter on list highlight records to see if it is on the homepage or not

### 11/14/2023

    corrected queries in dt_history, dt_entities, and dt_recent so historically viewed items return in the correct order.

    updated page_setup so there is a general outline/idea of how it will be put together.
    stripped most of the content from page_home so it can be populated with the correct content.

    updated input_entity to allow for hintContent
    updated input_number to have a break by default unless the "inline" attribute is applied on function call
    console master search now has the correct form action and hidden inputs for LTID/XID to point to entity search report

    shortened xTopbar to give more space on screen.
    made highlights slightly more narrow to give more space on screen.

    added placeholder xStoreTemplate in lib_pageTemplates. Will be used to construct the store front (Figma mock up)
    added page_store which will use storeTemplate (so will the products and product set pages)

    start adding entityGroups, productSets, and products.
        entityGroups table, nav links for all of them, linkedTable records for all of them, ecs module for each of them. Need table for productSets and products
    updated tb_menuItems because it was returning links the user couldn't access (incorrect syntax used in dbo.fn_accessLevel called from tb_menuItems)

### 11/13/2023

    Correct SELECT syntax in dt_highlights on console_bulletin that stopped returning highlights a day early.

    Updated console settings page to show employee setting first then user settings next. They're also separated by headers now.

    Removed z-index on xHint because it seems unnecessary.
        seems to work fine
        need to correct positioning for mobile/when it overflows the body
    Change .xHintContainer to position: sticky; to somewhat help positioning issues
    Added max-width 100dvw/vw and overflow-x: hidden to body. 
        Unsure if this will cause issues but testing each page revealed no obvious issues.

### 11/09/2023

    Clear site cache button only clears the session storage for the current website now.
    Added clear all sites cache button to remove all session storage items across all sites.

    Highlights can now be edited
        Still need to work on image stuff
        Images can be added inline if necessary
    Employee highlights now appear on the employee bulletin
    Refined highlights css

    Modified css for .shortcut-note to allow for images in notes

### 11/08/2023

    pr_highlight_new is finished
    Finished record view for console_highlights
        placeholder space left for analytics in the future
        record_edit seems to be complete but need to test it once pr_highlight_edit is finished
    update index_css and _dark for highlight styles
    created comp_highlights with highlight function

### 11/07/2023

    users can now report each LEID only one time (added UQ_linkedEntities_reported_entityReportedBy and errorMessage in pr_linkedEntity_report to enforce this)
    completed ecreport_reportedEntities
        Can list and filter reported entities
        Can resolve reports and view previous resolutions
        Users will see resolution if they try to report for the same reason
    Updated index_css and _dark to correct name of the check-sign icon (previously ok-sign)

    Began working on website and employee highlights
        highlights.svg icon 
        new tables highlightTypes and highlights
            populated highlightTypes
        finished list view for created highlights
        finished obj_record_new for highlights (need to create pr_highlight_new and test everything)
        placeholder obj_record_edit for highlights
        obj_highlight is currently empty

### 11/06/2023

    ECPages now uses "[websiteDescription]Cookie" as the name of the client cookie. This prevents cross-site cookie contamination causing bugs with login persistence.
    Bug fixed on "rights granted" page that caused the page not to show if an employee was marked as "isAdmin" and therefore has super-admin (lvl 7) privileges across the website.
    ECReport for reported entities list is complete.
        started working on view reported LEID view

### 11/02/2023

    Fixed bug causing obj_history, dt_recent, and dt_entities (all pulling from actionLog to see recently viewed and created records) that would only return results for userID 2. This prevented obj_history, new shortcut recent items menu, and comp_input_entity from working as expected.
    Improved SQL statement in obj_history, dt_recent, and dt_entities to execute faster.

    Fixed bug in accessRightsTo report to only show access rights related to the website.
    Fixed bug in accessRightsGranted report to only show access rights related to the website.
    Fixed order by in accessRightsGranted.
    Added detection for if the selected entity in accessRightsGranted is an admin (if so, a note shows saying they have access level 7 everywhere).

    Removed author from document keywords (including auto-generate)

### 11/01/2023

    Corrected queries in lib_pageTemplates for xDocTemplate to limit documents to whichever website the user is on
    Corrected query in console_document to only show sibling documents from the same site (issue only appeared for root documents from different websites
    Set documents title to be unique for each website instead of full database
    Added auto generation of Rules And Policies > Terms of Service, Privacy Policy documents in pr_website_autoConfig
    Updated status page to show new users for that website instead of all websites (alerts, errors, risks show from all sites and this is intended behavior)

### 10/31/2023

    websites are now only accepted if the subdomain is listed as an alternate domain
    creating a new website executes pr_website_autoConfig which creates a new user and super admin employee. Default sign in information is provided to the website creator. 
    fn_accessLevel returns 7 if the employeeID is for an isAdmin = 1 employee
    bug in new/edit alternate website URLs patched to prevent protocol (http:// or https://) from being entered in as part of the domain

### 10/30/2023

    corrected user sign up bug (websiteID not inserted into users table)
    removed erroneous css color attribute from #ect_topbar that caused menu items to not use color from other styles
    removed unnecessary !important from css background-color causing .tbl to highlight header rows
    updated .dropdown-content li:last-child to have extra padding on bottom so menu padding was as expected

    added hints (as title attribute) to various stats on /status page

    fixed typo in console_websites causing error messages to not show
    website alternate URLs can now use subdomains

### 10/27/2023

    Fixed a css layout issue with xTopbar causing the search bar to be unusable on mobile. Now a button appears that animates the searchbar into view, beneath the topbar, on mobile.
    Added new users count to /status

### 10/26/2023

    added linkedEntities_reportReasons and linkedEntities_reported tables
    added ecreport_reportedEntities placeholder report
    added obj_reportComment to comp_messages (can report content)
        may use this later to make a more global report box in comp_reportEntity
    added input_textArea and styles

### 10/25/2023

    xDocsTopbar fully merged into xTopbar
    appended bottombar to documents page
    modified spacing on documents page document header to be more appealing

### 10/24/2023

    employee shortcuts & notes items now only appear if employee can view said entity
    started working on merging xDocsTopbar into xTopbar
        remaining: left menu doesn't exist yet, needs button press to open

### 10/23/2024

    modified fix for console dvw overheight bug to be more robust
    finished implementing dark/light mode
    fixed bug in sessions causing website to not load because pr_user_establish session didn't delete old session storage when trying to delete associated session
    fixed bug where settings queries would only return assigned settings and not default settings if that setting wasn't assigned (e.g. theme not set to dark or light mode should return as light mode but wasn't)
    tinymce set to default or default-dark css_content to achieve proper indent (writer and document still available if needed)

### 10/20/2023

    Modified margin and padding on tComponent that was causing employee console to always be taller than the dvw.
    Added apr_sessionStorage_cleanup which deletes stored items that are older than 7 days old (runs daily).

### 10/19/2023

    settings can now be changed using settings report
    settings not set by user appear as the default setting
    added debug css layout setting
    added index-css-dark, which is loaded when dark mode is selected
        need to move dark styles here, and remove prefers-color-scheme: dark

    updated account page icons and added settings account page (currently empty)

### 10/18/2023

    added settingTypes (stores names/descriptions of settings), settingValues (allowed values for those settings), and settings (stored user, not session, settings) tables. 
    _dir now has dt_settings (with var userSettings pointing to it) which loads user settings for use throughout the application. Settings are automatically cached in sessionStorage 
        as they are cached, the cached storage item will have to be removed whenever new settings are saved

    added clear cache and clear website cache buttons to console settings page
        session cache is now cleared just before a session is deleted
    added settings dropdown which successfully submits a form for processing setting change

### 10/17/2023

    added websiteID to users table
    users.websiteID used for UQ_users_email (an email can only be used once per website)
    new and edit user procedures (sp and pr) modified to check for already existing email on website before allowing change to be made

    page_documents, console_documents, and console_knowledgebase updated to indent ordered and unordered lists
    added bulletin menu item in console left navigation

    finished ecreport_index

    created xSessionStorage -- stores a value (to a tag) in the sessionStorage table.
        The tag is whatever the developer specifies and the sessionID is automatically appended to further decrease ambiguity.
        If the stored item doesn't exist then it is inserted, otherwise the stored value is used instead of being generated for every request (e.g. console left navigation menu).
        developer can use the overwrite parameter to overwrite the value with the generated value
        need to add clear session storage button in settings and created apr_ to clear old stored values (and values associated with deleted sessions)
            this will require various terminate/end sessions procedures to also delete from sessionStorage to prevent foreign key errors

### 10/16/2023

    modified reports (blacklistedIPs, entityInUserGroups, actionLog, errorLog, alertLog, and riskLog) to use SQL views
    removed insertRecord, updateRecord, deleteRecord from type tDataObj 

    setup console home page placeholder

    corrected error in page_documents regarding whether or not to log missing documents
    logging when cookies mismatch to determine early logout error issue

### 10/13/2023

    ecreports is now ltid 105, to enable access rights for them
        modified urls to point to ltid=105&xid=reportID (in ecreports table)
    xConsoleSearchBox automatically populates LTID and XID hidden inputs

    tb_menuItems filters on access rights
    hid access rights, rights granted, logs buttons if user doesn't have access

    added various pages such as ecreport_navMenu, settings, seoProblems to eliminate module not found errors
        these pages need to be developed in the future (along with ecreport_index)

    pr_knowledgebase_new and _edit xssProtect changed from 5 to 4 to allow dates in KB title
        started keeping track of website codebase changes via dev notes KB

## END OF HISTORY
