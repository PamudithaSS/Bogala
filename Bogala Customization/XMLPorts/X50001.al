xmlport 50001 "Bank Statement"
{
    schema
    {
        tableelement("Bank Acc. Reconciliation Line"; "Bank Acc. Reconciliation Line")
        {
            XmlName = 'Bank_Statement';
            fieldattribute(Check_No; "Bank Acc. Reconciliation Line"."Check No.")
            { }
            fieldattribute(Document_No; "Bank Acc. Reconciliation Line"."Document No.")
            { }
            fieldattribute(Transaction_Date; "Bank Acc. Reconciliation Line"."Transaction Date")
            { }
            fieldattribute(Description; "Bank Acc. Reconciliation Line".Description)
            { }
            fieldattribute(Statement_amount; "Bank Acc. Reconciliation Line"."Statement Amount")
            { }
            fieldattribute(Payer_Information; "Bank Acc. Reconciliation Line"."Related-Party Name")     //"Bank Acc. Reconciliation Line"."Payer Information")  ---OLD in 2013DB---
            { }
        }
    }

    requestpage
    {
        layout
        { }

        actions
        { }
    }
}

