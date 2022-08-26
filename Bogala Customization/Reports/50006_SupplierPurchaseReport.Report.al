report 50006 "Supplier Purchase Report"
{
    //DefaultLayout = RDLC;
    RDLCLayout = './Reports/Supplier Purchase Report.rdl';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "Posting Date";
            column(PuechedDate; FORMAT("Posting Date"))
            { }
            column(Supplier; "Purchase Header"."Buy-from Vendor Name")
            { }
            column(CreateUser; "Purchase Header"."Created User")
            { }
            column(PurchesNo; "Purchase Header"."No.")
            { }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE(Type = FILTER(Item));
                column(ItemNo; "Purchase Line"."No.")
                { }
                column(ItemName; "Purchase Line".Description)
                { }
                column(Quantity; "Purchase Line".Quantity)
                { }
                column(Value; "Purchase Line"."Direct Unit Cost")
                { }
                column(LineAmount; "Purchase Line"."Line Amount")
                { }
            }
            trigger OnPreDataItem()
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
                    Caption = 'User Name';
                    ApplicationArea = All;
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