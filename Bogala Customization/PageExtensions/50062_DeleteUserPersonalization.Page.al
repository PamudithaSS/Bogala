// pageextension 50062 DeleteUserPersonalization extends "Delete User Personalization"
// {
//     trigger OnOpenPage()
//     var
//         UserSetup: Record "User Setup";
//     begin
//         UserSetup.GET(USERID);
//         IF NOT UserSetup."User Role Center" THEN
//             ERROR('You do not have access right to change role center');
//     end;
// }