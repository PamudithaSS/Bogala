pageextension 50015 SalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        // addafter(Description)
        // {
        //     field("Description 2"; Rec."Description 2")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
        addafter("Location Code")
        {
            field("No.of Packages"; Rec."No.of Packages")
            {
                ApplicationArea = All;
                Visible = false;

            }
            field("count"; Rec."count")
            {
                ApplicationArea = All;
                Caption = 'Package QTY';
                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    "No.of Packages" := Format(count) + "pakage name";
                end;
            }
            field("pakage name"; Rec."pakage name")
            {
                ApplicationArea = All;
                Caption = 'Package Type';
                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    "No.of Packages" := Format(count) + "pakage name";
                end;
            }
            field("No Of Units"; Rec."No Of Units")
            {
                ApplicationArea = All;
            }
            field("H.S.Code"; Rec."H.S.Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("Line No.")
        {
            field("Shipping Marks"; Rec."Shipping Marks")
            {
                ApplicationArea = All;
            }
            field("Packing Comm."; Rec."Packing Comm.")
            {
                ApplicationArea = All;
            }
        }
        modify("Tax Group Code")
        {
            ApplicationArea = All;
        }
        modify("Tax Liable")
        {
            ApplicationArea = All;
        }
        modify("Tax Area Code")
        {
            ApplicationArea = All;
        }

    }
}