query 50001 "waruna re01"
{
    elements
    {
        dataitem(GLEntry; "G/L Entry")
        {
            column(EntryNo; "Entry No.")
            { }
            column(GLAccNo; "G/L Account No.")
            { }
            column(Amount; Amount)
            { }
            column(DebitAmount; "Debit Amount")
            { }
            column(CreditAmount; "Credit Amount")
            { }
            column(GlobalDim1Code; "Global Dimension 1 Code")
            { }
            column(GlobalDim2Code; "Global Dimension 2 Code")
            { }
            column(PostDate; "Posting Date")
            { }
            column(Description; Description)
            { }
            dataitem(GLRegister; "G/L Register")
            {
                DataItemLink = "Source Code" = GLEntry."Source Code", "User ID" = GLEntry."User ID";
                column(SourceCode; "Source Code")
                { }
                column(UserID; "User ID")
                { }
                column(CreatDate; "Creation Date")
                { }
                column(JournalBatch_ame; "Journal Batch Name")
                { }
            }
        }
    }
}

