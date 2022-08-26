pageextension 50010 ItemJournal extends "Item Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
            }
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Location Code")
        {
            Visible = true;
            trigger OnAfterValidate()
            var
                WMSManagement: Codeunit "WMS Management";
            begin
                WMSManagement.CheckItemJnlLineLocation(Rec, xRec);
            end;
        }
        modify("Bin Code")
        {
            Visible = false;
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify("External Document No.")
        {
            Visible = true;
            trigger OnAfterValidate()
            VAR
                ItemLedgerEntry: Record "Item Ledger Entry";
                TextE0001: TextConst ENU = 'External Document No. %1 allready exsist in Posted Document %2';
            BEGIN
                ItemLedgerEntry.SETRANGE("External Document No.", Rec."External Document No.");
                IF ItemLedgerEntry.FINDFIRST THEN
                    ERROR(TextE0001, Rec."External Document No.", ItemLedgerEntry."Document No.");
            END;
        }
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                Rec.TestField("External Document No.");
            end;
        }
    }

    var
        myInt: Integer;
}