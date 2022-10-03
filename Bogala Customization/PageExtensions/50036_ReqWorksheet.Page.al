pageextension 50036 ReqWorksheet extends "Req. Worksheet"
{
    layout
    {
        addafter("Variant Code")
        {
            field("No. Series"; Rec."No. Series")
            {
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    actions
    {
        addafter(CarryOutActionMessage)
        {
            Action(GLVoucher)
            {
                Image = PrintReport;
                Ellipsis = true;
                Caption = 'Remove Action Message';
                PromotedIsBig = true;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                BEGIN
                    Rec.MODIFYALL("Accept Action Message", FALSE);
                END;
            }
        }
    }
}