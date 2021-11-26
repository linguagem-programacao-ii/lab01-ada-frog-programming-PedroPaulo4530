with    Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;
use     Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;

procedure SapoGame is

    altura_salto : Integer;
    n_tubos : Integer;
    tubo_atual : Integer;
    salto_atual : Integer;
    auxIndex : Natural;
    divIndex : Integer;
    auxArray : String(1..300) := (others => ' ');
    aux : String := " ";


    procedure calcMove(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Temp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Temp);
        else Move(Source(Source'First .. Pos-1), Temp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Temp);
    end calcMove;
    
begin
    Get_Line(Item => auxArray, Last => auxIndex);
    divIndex := Index(Source => auxArray, Pattern => aux, From => 1);
    calcMove(Source => auxArray, Pos => divIndex, Value => altura_salto, Remainder => auxArray);
    calcMove(Source => auxArray, Pos => auxArray'Last, Value => n_tubos, Remainder => auxArray);
    Get_Line(Item => auxArray, Last => auxIndex);
    for i in 1 .. n_tubos loop
        divIndex := Index(Source => auxArray, Pattern => aux, From => 1);
        calcMove(Source => auxArray, Pos => divIndex, Value => salto_atual, Remainder => auxArray);
        if i /= 1 and abs(salto_atual - tubo_atual) > altura_salto then
            Put_Line("!!!!GAME OVER!!!!");
            exit;
        end if;
        tubo_atual := salto_atual;
        if i = n_tubos then
            Put_Line("!!!!YOU WIN!!!!");
        end if;
    end loop;
end SapoGame;
