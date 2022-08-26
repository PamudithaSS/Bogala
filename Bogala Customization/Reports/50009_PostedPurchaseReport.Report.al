report 50009 "Posted Purchase Report"
{
    // version Arjuna

    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Posted Purchase Report.rdl';

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);
            RequestFilterFields = "Posting Date";
            column(PuechedDate; FORMAT("Posting Date"))
            { }
            column(Supplier; "Buy-from Vendor Name")
            { }
            column(CreateUser; "Created User")
            { }
            column(PurchesNo; "No.")
            { }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item));
                column(ItemNo; "No.")
                { }
                column(ItemName; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Value; "Direct Unit Cost")
                { }
                column(LineAmount; "Purch. Inv. Line"."Line Amount")
                { }
            }
            trigger OnPreDataItem();
            begin
                SETRANGE("Created User", User_);
            end;
        }
    }
    requestpage
    {

        layout
        {
            area(content)
            {
                field(User_; User_)
                {
                    ApplicationArea = All;
                    Caption = 'User Name';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        User: Record User;
                    begin
                        IF ACTION::LookupOK = PAGE.RUNMODAL(9800, User) THEN
                            User_ := User."User Name";
                    end;
                }
            }
        }
    }
    var
        User_: Code[50];
}

