-------------------------------------------------------------------------------
--
-- demo_combinatoire.vhd
--
-- Processeur qui effectue des calculs sur un nombre donn�e en entr�e.
-- Toutes les fonctions sont purement combinatoires.
--
-- v. 1.1 2022-01-04 Pierre Langlois
-- ** CETTE VERSION COMPORTE DES ERREURS DE SYNTAXE ET DES ERREURS FONCTIONNELLES **
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demo_combinatoire is       
	generic (
	    W : integer := 4 -- nombre de bits pour repr�senter le nombre
	);
	
	port (
	    A : in unsigned(W - 1 downto 0);
	    pair: out std_logic;        -- indique si le nombre est pair
	    divpar4 : out std_logic;    -- indique si le nombre est divisible par 4
	    divpar5 : out std_logic;    -- indique si le nombre est divisible par 5
	    divpar8 : out std_logic     -- indique si le nombre est divisible par 8
		-- CORRECTION ERREUR DE SYNTAXE a la ligne 27 : supression du ';' 
	);
end demo_combinatoire;


architecture arch1 of demo_combinatoire is
begin                          
    
    pair <= not(A(0)); -- CORRECTION ERREUR DE SYNTAXE a la ligne 36 : ajout d'une parenthese fermante ')'	-- CORRECTION ERREUR FONCTIONNELLE a la ligne 36 : modification de A(1) par A(0)
    
    divpar4 <= (not(A(3)) and not(A(2)) and not (A(1)) and not(A(0))) -- m0
    or (not(A(3)) and (A(2)) and not(A(1)) and not(A(0))) -- m4
    or ((A(3)) and not(A(2)) and not(A(1)) and not(A(0))) -- m8	 -- CORRECTION a la ligne 40 : ajout d'une parenthese fermante ')'
    or ((A(3)) and (A(2)) and not(A(1)) and not(A(0))); -- m12
    
    with to_integer(A) select
    divpar5 <=
        '1' when 0,
        '1' when 5,	-- CORRECTION ERREUR FONCTIONNELLE a la ligne 46 : modification de 6 par 5
        '1' when 10,
        '1' when 15, -- CORRECTION ERREUR DE SYNTAXE a la ligne 48 : ajout d'une virgule ','
        '0' when others;
        
    divpar8 <= '1' when A = "1000" or A = "0000" else '0';	-- CORRECTION ERREUR FONCTIONNELLE a la ligne 51 : modification de A = 0001 par A = "0000"
    
end arch1; -- CORRECTION ERREUR DE SYNTAXE a la ligne 53 : modification du nom de l'architecture (de 'arch' a 'arch1')
