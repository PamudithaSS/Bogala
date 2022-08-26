pageextension 50061 UserPersonalizationCard extends "User Settings"
{
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."User Role Center" THEN
            ERROR('You do not have access right to change role center');
    end;
}