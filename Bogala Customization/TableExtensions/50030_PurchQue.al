tableextension 50030 PurchQueExt extends "Purchase Cue"
{
    fields
    {
        field(50050; "Request to Approve"; Integer)
        {
            //DataClassification =ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"), Status = filter(Open)));

        }
        field(50051; "Purchase Quotes - Released"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Document Type" = const(Quote), Status = const(Released)));
        }
    }

    var
        myInt: Integer;
}