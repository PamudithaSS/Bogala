xmlport 50000 "Deutsche bank data exporting"
{
    schema
    {
        tableelement("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            XmlName = 'Deutsche_bank_data_exporting';
            fieldelement(Posting_Date; "Bank Account Ledger Entry"."Posting Date")
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

