-- Comandos para criar as tabelas

REATE TABLE "funcionario" (
  "func_cd_id" serial,
  "func_tx_nome" varchar(40) not null,
  "func_tx_cpf" varchar(11) not null unique,
  PRIMARY KEY ("func_cd_id")
);

CREATE TABLE "cliente" (
  "cli_cd_id" serial not null,
  "cli_tx_nome_completo" varchar(40) not null,
  "cli_tx_email" varchar(40) not null unique,
  "cli_tx_cpf" varchar(11) not null,
  "cli_dt_nascimento" date not null,
  "cli_tx_endereco" varchar(255) not null,
  PRIMARY KEY ("cli_cd_id")
);

CREATE TABLE "categoria" (
  "cat_cd_id" serial not null,
  "cat_tx_nome" varchar(20)not null unique,
  "cat_tx_descricao" varchar(255),
  "func_cd_id" int4 not null,
  PRIMARY KEY ("cat_cd_id"),
  CONSTRAINT "FK_categoria.func_cd_id"
    FOREIGN KEY ("func_cd_id")
      REFERENCES "funcionario"("func_cd_id")
);

CREATE TABLE "produto" (
  "prod_cd_id" serial not null,
  "prod_tx_nome" varchar(20) not null unique,
  "prod_tx_descricao" varchar(255),
  "prod_int_quantidade" int4 not null,
  "prod_dec_valor" decimal not null,
  "prod_dt_fabricacao" date not null,
  "cat_cd_id" int4 not null,
  "func_cd_id" int4 not null,
  PRIMARY KEY ("prod_cd_id"),
  CONSTRAINT "FK_produto.func_cd_id"
    FOREIGN KEY ("func_cd_id")
      REFERENCES "funcionario"("func_cd_id"),
  CONSTRAINT "FK_produto.cat_cd_id"
    FOREIGN KEY ("cat_cd_id")
      REFERENCES "categoria"("cat_cd_id")
);

CREATE TABLE "pedido" (
  "ped_cd_id" serial not null,
  "ped_dt_data" date not null,
  "cli_cd_id" int4 not null,
  PRIMARY KEY ("ped_cd_id"),
  CONSTRAINT "FK_pedido.cli_cd_id"
    FOREIGN KEY ("cli_cd_id")
      REFERENCES "cliente"("cli_cd_id")
);

CREATE TABLE "item_pedido" (
  "item_pedi_cd_id" serial not null,
  "item_pedi_int_quantidade" int4 not null,
  "item_pedi_dec_valor_uni" decimal not null,
  "ped_cd_id" int4 not null,
  "prod_cd_id" int4 not null,
  PRIMARY KEY ("item_pedi_cd_id"),
  CONSTRAINT "FK_item_pedido.ped_cd_id"
    FOREIGN KEY ("ped_cd_id")
      REFERENCES "pedido"("ped_cd_id"),
  CONSTRAINT "FK_item_pedido.prod_cd_id"
    FOREIGN KEY ("prod_cd_id")
      REFERENCES "produto"("prod_cd_id")
);

INSERT INTO public.funcionario (func_tx_nome,func_tx_cpf) VALUES
	 ('Erick Viana','43567562796'),
	 ('Raphaela Fagundes','23585787952'),
	 ('Paulo Petersen','12554887996'),
	 ('Leandro Ferraz','36556987945'),
	 ('Poema Bochner','25336545789'),
	 ('Tiago Souza','36458925354');

	
-- Comandos para inserir dados nas tabelas

INSERT INTO public.cliente (cli_tx_nome_completo,cli_tx_email,cli_tx_cpf,cli_dt_nascimento,cli_tx_endereco) VALUES
	 ('Ana Julia da Mata','ana4142@uorak.com','58301075031','2002-08-10','3ª Subida do Comissário, n. 483, Nova Descoberta, Recife - PE. CEP: 52190-264'),
	 ('Diogo Melo','diogo5563@uorak.com','23427457028','1996-07-20','Beco Getúlio Vargas, N. 578, Vila Renascer, Contagem - MG. CEP: 32052-050'),
	 ('Benjamin Nascimento','bennas4561@uorak.com','71517139082','2000-04-03','Rua Benjamin Constant, n. 736, São Cristóvão, Porto Velho - RO. CEP: 76804-004 '),
	 ('Manuela Nunes','manu1103@uorak.com','39149075098','1989-05-22','Rua 5 A, n. 484, Jardim Aureny II (Taquaralto), Palmas - TO. CEP: 77060-237'),
	 ('Sofia Campos','sofica2832@uorak.com','48333683070','1999-02-15','Rua Netuno, n. 343, Morada do Sol, Rio Branco - AC. CEP: 69901-127');


INSERT INTO public.categoria (cat_tx_nome,cat_tx_descricao,func_cd_id) VALUES
	 ('Fogo','Super efetivo contra Inseto, Aço, Planta e Gelo, resistente contra Aço, Fogo, Planta, Gelo, Inseto e Fada, Fraco contra Água, Terrestre e Pedra',1),
	 ('Inseto','Super efetivo contra Planta, Psíquico e Noturno, resistente contra Lutador, Planta e Terrestre, fraco contra Fogo, Voador e Pedra',2),
	 ('Fantasma','Super efetivo contra Fantasma e Psíquico, resistente contra Venenoso e Inseto, fraco contra Fantasma e Noturno, imune contra Normal e Lutador',3),
	 ('Água','Super efetivo contra Terrestre, Pedra e Fogo, resistente contra Fogo, Água, Gelo e Aço, fraco contra Planta e Elétrico',3),
	 ('Elétrico','Super efetivo contra Voador e Água, resistente contra Elétrico, Voador e Aço, fraco contra Terrestre',4),
	 ('Dragão','Super efetivo contra Dragão, resistente contra Elétrico, Fogo, Água e inseto, fraco contra Gelo, Dragão e Fada',5),
	 ('Planta','Super efetivo contra Terrestre, Pedra e Água, resistente contra Água, Planta, Terrestre e Elétrico, fraco contra Fogo, Voador, Gelo, Venenoso e Inseto',6),
	 (' Psíquico','Super efetivo contra Lutador e Venenoso, resistente contra Psíquico e Lutador, Fraco contra Inseto, Fantasma e Noturno',5);

INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Litten ','Se você tentar muito se aproximar dele, ele não se abrirá para você. Mesmo se você se aproximar, dar muito carinho ainda é um não-não.',8,19,'2022-01-01',1,4),
	 ('Cyndaquil ','Cyndaquil se protege acendendo as chamas em suas costas. As chamas são vigorosas se o Pokémon estiver com raiva. No entanto, se estiver cansado, as chamas crepitam irregularmente com combustão incompleta.',43,9.99,'2022-01-01',1,4),
	 ('Flareon ','Depois de armazenar calor suficiente, a temperatura corporal deste Pokémon pode atingir até 1.700 graus Fahrenheit.',55,5.50,'2022-01-01',1,4),
	 ('Moltres ','É um dos Pokémon pássaros lendários. Quando Moltres bate suas asas flamejantes, elas brilham com um brilho vermelho deslumbrante.',17,150.99,'2022-01-01',1,4),
	 ('Butterfree ','Na batalha, ele bate as asas em grande velocidade para liberar poeira altamente tóxica no ar.',40,45,'2022-01-01',2,2),
	 ('Shuckle ','Ele armazena frutas dentro de sua casca. Para evitar ataques, ele se esconde sob as rochas e permanece completamente imóvel.',55,29,'2022-01-01',2,2),
	 ('Scyther ','À medida que Scyther luta mais e mais batalhas, seu scyther se torna cada vez mais afiado. Com um único corte, Scyther pode derrubar uma árvore enorme.',14,5.50,'2022-01-01',2,2),
	 ('Volcarona ','Volcarona espalha escamas ardentes. Alguns dizem que faz isso para iniciar incêndios. Outros dizem que está tentando resgatar aqueles que sofrem no frio.',36,9.70,'2022-01-01',2,3),
	 ('Paras ','Cria tocas sob o solo para roer as raízes das árvores. Os cogumelos nas costas absorvem a maior parte da nutrição.',78,8.24,'2022-01-01',2,3),
	 ('Gengar ','Na noite de lua cheia, se as sombras se movem sozinhas e riem, deve ser culpa de Gengar.',11,8.50,'2022-01-01',3,2);
INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Spiritomb ','Exatamente 108 espíritos se reuniram para se tornar este Pokémon. Aparentemente, há alguns espíritos mal-humorados na mistura.',4,9.0,'2022-01-01',3,2),
	 ('Litwick ','A chama em sua cabeça mantém seu corpo ligeiramente quente. Este Pokémon pega as crianças perdidas pela mão para guiá-las ao mundo espiritual.',1,7.4,'2022-01-01',3,2),
	 ('Spectrier ','Ele sonda seus arredores com todos os seus sentidos, exceto um - ele não usa o sentido da visão. Dizem que os chutes de Spectrier separam a alma do corpo.',9,200.00,'2022-01-01',3,2),
	 ('Wishiwashi ','Individualmente, eles são incrivelmente fracos. É reunindo-se nas escolas que eles são capazes de enfrentar os oponentes.',74,14,'2022-08-24',4,1),
	 ('Greninja ','Ele cria estrelas de arremesso de água comprimida. Quando as gira e as lança em alta velocidade, essas estrelas podem dividir o metal em dois.',36,34,'2021-01-01',4,3),
	 ('Pikachu ','Pikachu pode gerar eletricidade poderosa, tem bolsas nas bochechas que são extra macias e super elásticas.',3,15,'2022-01-01',5,5),
	 ('Mareep ','As roupas feitas de lã de Mareep são facilmente carregadas com eletricidade estática, então um processo especial é usado nela.',6,22,'2022-01-01',5,5),
	 ('Dedenne ','Os bigodes de um Dedenne captam ondas elétricas que outros Dedenne enviam. Esses Pokémon compartilham locais de comida ou eletricidade entre si.',88,39,'2022-01-01',5,6),
	 ('Raikou ','Raikou incorpora a velocidade do relâmpago. Os rugidos deste Pokémon enviam ondas de choque que estremecem o ar e sacodem o chão como se relâmpagos tivessem caído.',42,178,'2022-01-01',5,5),
	 ('Electivire ','A quantidade de energia elétrica que este Pokémon produz é proporcional à taxa de seu pulso. A tensão salta enquanto o Electivire está lutando.',27,5.99,'2022-01-01',5,6);
INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Dratini ','Dratini mora perto de corpos de água que fluem rapidamente, como as piscinas de cachoeiras. À medida que cresce, Dratini muda de pele muitas vezes.',43,6,'2022-08-24',7,5),
	 ('Salamamce ','Salamence é um Pokémon incomum, pois foi capaz de evoluir um corpo com asas apenas desejando constantemente poder voar.',47,14,'2022-08-24',7,5),
	 ('Hydreigon ','Há uma série de histórias sobre aldeias que foram destruídas por Hydreigon. Ele morde qualquer coisa que se mova.',13,17,'2022-08-24',7,5),
	 ('Dragapult ','Quando não está lutando, mantém Dreepy nos buracos em seus chifres. Uma vez que uma luta começa, ele lança o Dreepy como mísseis supersônicos.',56,16,'2022-08-24',7,5),
	 ('Rayquaza ','Diz-se que Rayquaza viveu por centenas de milhões de anos. Permanecem as lendas de como acabou o confronto entre Kyogre e Groudon',7,350,'2022-08-24',7,5),
	 ('Gardevoir ','Tem o poder de prever o futuro. Seu poder atinge o pico quando está protegendo seu Treinador.',55,71,'2022-08-24',8,4),
	 ('Lugia ','As asas de Lugia possuem um poder devastador – um leve bater de suas asas pode destruir casas comuns. Como resultado, este Pokémon escolhe viver fora de vista nas profundezas do mar.',36,290,'2022-08-24',8,4),
	 ('Meditite ','Meditite realiza um rigoroso treinamento mental nas profundezas das montanhas. No entanto, sempre que medita, este Pokémon sempre perde a concentração e o foco. Como resultado, seu treinamento nunca termina.',73,81,'2022-08-24',8,4),
	 ('Charizard ',' Ele cospe fogo que é quente o suficiente para derreter pedregulhos. Pode causar incêndios florestais soprando chamas.',11,23,'2022-01-01',1,4),
	 ('Misdreavus ','O que dá sentido à sua vida é surpreender os outros. Se você encostar o ouvido nas esferas vermelhas em volta do pescoço, poderá ouvir gritos.',43,5.9,'2022-01-01',3,2);
INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Poliwag ','Para Poliwag, nadar é mais fácil do que caminhar. O padrão de redemoinho em sua barriga é, na verdade, parte das entranhas do Pokémon que aparecem através da pele.',15,10.50,'2022-08-04',4,1),
	 ('Swampert ','Swampert é muito forte. Tem poder suficiente para arrastar facilmente uma pedra pesando mais de uma tonelada. Este Pokémon também tem uma visão poderosa que permite ver mesmo em águas turvas.',10,15.00,'2005-10-04',4,1),
	 ('Quagsire ','Tem uma natureza descontraída. Ele não se importa se bater a cabeça em barcos e pedregulhos enquanto nada.',3,29.00,'2021-08-09',4,1),
	 ('Bulbasaur ','Há uma semente de planta nas costas desde o dia em que este Pokémon nasce. A semente cresce lentamente.',11,77,'2000-01-01',6,6),
	 ('Sceptile ','As folhas que crescem no corpo de Sceptile são muito afiadas. Este Pokémon é muito ágil - salta por cima dos galhos das árvores e salta sobre o inimigo por cima ou por trás.',6,45,'2000-01-01',6,6),
	 ('Roselia ','Suas flores exalam uma fragrância relaxante. Quanto mais forte o seu aroma, mais saudável é a Roselia.',5,18,'2000-01-01',6,6),
	 ('Amoongus ','Este Pokémon sopra esporos venenosos em seus inimigos. Se os esporos não forem lavados rapidamente, eles se transformarão em cogumelos onde quer que pousem.',99,73,'2000-01-01',6,6),
	 ('Rillaboom ','Ao tocar bateria, ele aproveita o poder de seu toco de árvore especial. As raízes do toco seguem sua direção na batalha.',150,28,'2000-01-01',6,6),
	 ('Abra ','Este Pokémon usa seus poderes psíquicos enquanto dorme. O conteúdo dos sonhos de Abra afeta os poderes que o Pokémon exerce.',10,45,'2022-08-24',8,4),
	 ('Mr.Mime','A largura de suas mãos pode não ser coincidência – muitos cientistas acreditam que suas palmas se tornaram maiores especificamente para a mímica.',11,38,'2022-08-24',8,4);
	
	
INSERT INTO public.pedido (ped_dt_data,cli_cd_id) VALUES
	 ('2022-04-04',4),
	 ('2022-05-03',5),
	 ('2022-06-20',1),
	 ('2022-07-25',2),
	 ('2022-08-25',3);
	
INSERT INTO public.item_pedido (item_pedi_int_quantidade,item_pedi_dec_valor_uni,ped_cd_id,prod_cd_id) VALUES
	 (2,9.99,1,2),
	 (1,5.99,1,20),
	 (3,15,2,16),
	 (1,150.99,2,4),
	 (1,81,2,28),
	 (20,5.99,3,20),
	 (1,290,4,27),
	 (1,23,4,29),
	 (5,6,5,21),
	 (2,9.70,5,8),
	 (1,200,5,13);

-- Comando para atualizar um registro
	
update 
	funcionario 
set 
	func_tx_cpf = '12345678901' 
where 
	func_tx_cpf ='36556987945'; 


-- Comando para deletar um registro

delete from 
	produto 
where 
	prod_tx_nome  = 'Mr.Mime';


-- Comandos para consultas

select * from 
	cliente;

select 
	cat_tx_nome, prod_tx_nome
from 
	produto 
inner join 
	categoria 
on 
	categoria.cat_cd_id = produto.cat_cd_id;


select 
	func_tx_nome, prod_tx_nome
from 
	funcionario 
inner join 
	produto 
on 
	produto.func_cd_id = funcionario.func_cd_id;


select 
	categoria.cat_tx_nome, COUNT(prod_cd_id)
FROM 
	produto
inner join 
	categoria 
on 
	categoria.cat_cd_id = produto.cat_cd_id 
group by 
	(categoria.cat_cd_id);




-- Nota fiscal
--Detalhamento

select
	p.ped_cd_id  as "Numero do Pedido",
	p.ped_dt_data as "Data da Venda",
	c.cli_tx_nome_completo as "Nome Completo",
	c.cli_tx_cpf as "CPF",
	ip.item_pedi_int_quantidade as "Quantidade",
	prod.prod_tx_nome as "Produto",
	prod.prod_dec_valor as "Valor Unitário",
	sum(ip.item_pedi_dec_valor_uni  * ip.item_pedi_int_quantidade) as "Valor Total"
from 
	pedido p  
inner join 
	cliente c  
on 
	p.cli_cd_id  = c.cli_cd_id 
inner join 
	item_pedido ip 
on 
	ip.ped_cd_id = p.ped_cd_id
inner join 
	produto prod
on 
	prod.prod_cd_id  = ip.prod_cd_id   
where 	
	c.cli_tx_nome_completo = :nm_cliente 
	--p.ped_dt_data = :dt_pedido
	--p.ped_cd_id = :nr_pedido 
group by 
	p.ped_cd_id, c.cli_tx_nome_completo, c.cli_tx_cpf, ip.item_pedi_int_quantidade, prod.prod_tx_nome, prod.prod_dec_valor;



-- Valor total da nota
	
select
	sum(ip.item_pedi_dec_valor_uni  * ip.item_pedi_int_quantidade) as "Valor Total da Nota"
from 
	pedido p  
inner join 
	cliente c  
on 
	p.cli_cd_id  = c.cli_cd_id 
inner join 
	item_pedido ip 
on 
	ip.ped_cd_id = p.ped_cd_id
inner join 
	produto prod
on 
	prod.prod_cd_id  = ip.prod_cd_id   
where 	
	cli_tx_nome_completo = :nm_cliente 
	--and ped_dt_data = :dt_pedido
	--p.ped_cd_id = :nr_pedido 
group by 
	p.ped_cd_id;















