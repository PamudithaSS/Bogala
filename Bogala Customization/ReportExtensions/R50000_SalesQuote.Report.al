reportextension 50000 SalesQuote extends "Standard Sales - Quote"
{
    dataset
    {
        add(Header)
        {
            column(Status; Status)
            { }
            column(BankAccount_No; BankAccount_."No.")
            { }
            column(BankAccount_BankAccountNo; BankAccount_."Bank Account No.")
            { }
        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                BankAccount_.RESET;
                BankAccount_.SETFILTER("No.", "Bank Code");
                IF BankAccount_.FINDFIRST THEN;
            end;
        }
    }
    var
        BankAccount_: Record "Bank Account";
}