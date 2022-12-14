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
	 ('Ana Julia da Mata','ana4142@uorak.com','58301075031','2002-08-10','3?? Subida do Comiss??rio, n. 483, Nova Descoberta, Recife - PE. CEP: 52190-264'),
	 ('Diogo Melo','diogo5563@uorak.com','23427457028','1996-07-20','Beco Get??lio Vargas, N. 578, Vila Renascer, Contagem - MG. CEP: 32052-050'),
	 ('Benjamin Nascimento','bennas4561@uorak.com','71517139082','2000-04-03','Rua Benjamin Constant, n. 736, S??o Crist??v??o, Porto Velho - RO. CEP: 76804-004 '),
	 ('Manuela Nunes','manu1103@uorak.com','39149075098','1989-05-22','Rua 5 A, n. 484, Jardim Aureny II (Taquaralto), Palmas - TO. CEP: 77060-237'),
	 ('Sofia Campos','sofica2832@uorak.com','48333683070','1999-02-15','Rua Netuno, n. 343, Morada do Sol, Rio Branco - AC. CEP: 69901-127');


INSERT INTO public.categoria (cat_tx_nome,cat_tx_descricao,func_cd_id) VALUES
	 ('Fogo','Super efetivo contra Inseto, A??o, Planta e Gelo, resistente contra A??o, Fogo, Planta, Gelo, Inseto e Fada, Fraco contra ??gua, Terrestre e Pedra',1),
	 ('Inseto','Super efetivo contra Planta, Ps??quico e Noturno, resistente contra Lutador, Planta e Terrestre, fraco contra Fogo, Voador e Pedra',2),
	 ('Fantasma','Super efetivo contra Fantasma e Ps??quico, resistente contra Venenoso e Inseto, fraco contra Fantasma e Noturno, imune contra Normal e Lutador',3),
	 ('??gua','Super efetivo contra Terrestre, Pedra e Fogo, resistente contra Fogo, ??gua, Gelo e A??o, fraco contra Planta e El??trico',3),
	 ('El??trico','Super efetivo contra Voador e ??gua, resistente contra El??trico, Voador e A??o, fraco contra Terrestre',4),
	 ('Drag??o','Super efetivo contra Drag??o, resistente contra El??trico, Fogo, ??gua e inseto, fraco contra Gelo, Drag??o e Fada',5),
	 ('Planta','Super efetivo contra Terrestre, Pedra e ??gua, resistente contra ??gua, Planta, Terrestre e El??trico, fraco contra Fogo, Voador, Gelo, Venenoso e Inseto',6),
	 (' Ps??quico','Super efetivo contra Lutador e Venenoso, resistente contra Ps??quico e Lutador, Fraco contra Inseto, Fantasma e Noturno',5);

INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Litten ','Se voc?? tentar muito se aproximar dele, ele n??o se abrir?? para voc??. Mesmo se voc?? se aproximar, dar muito carinho ainda ?? um n??o-n??o.',8,19,'2022-01-01',1,4),
	 ('Cyndaquil ','Cyndaquil se protege acendendo as chamas em suas costas. As chamas s??o vigorosas se o Pok??mon estiver com raiva. No entanto, se estiver cansado, as chamas crepitam irregularmente com combust??o incompleta.',43,9.99,'2022-01-01',1,4),
	 ('Flareon ','Depois de armazenar calor suficiente, a temperatura corporal deste Pok??mon pode atingir at?? 1.700 graus Fahrenheit.',55,5.50,'2022-01-01',1,4),
	 ('Moltres ','?? um dos Pok??mon p??ssaros lend??rios. Quando Moltres bate suas asas flamejantes, elas brilham com um brilho vermelho deslumbrante.',17,150.99,'2022-01-01',1,4),
	 ('Butterfree ','Na batalha, ele bate as asas em grande velocidade para liberar poeira altamente t??xica no ar.',40,45,'2022-01-01',2,2),
	 ('Shuckle ','Ele armazena frutas dentro de sua casca. Para evitar ataques, ele se esconde sob as rochas e permanece completamente im??vel.',55,29,'2022-01-01',2,2),
	 ('Scyther ','?? medida que Scyther luta mais e mais batalhas, seu scyther se torna cada vez mais afiado. Com um ??nico corte, Scyther pode derrubar uma ??rvore enorme.',14,5.50,'2022-01-01',2,2),
	 ('Volcarona ','Volcarona espalha escamas ardentes. Alguns dizem que faz isso para iniciar inc??ndios. Outros dizem que est?? tentando resgatar aqueles que sofrem no frio.',36,9.70,'2022-01-01',2,3),
	 ('Paras ','Cria tocas sob o solo para roer as ra??zes das ??rvores. Os cogumelos nas costas absorvem a maior parte da nutri????o.',78,8.24,'2022-01-01',2,3),
	 ('Gengar ','Na noite de lua cheia, se as sombras se movem sozinhas e riem, deve ser culpa de Gengar.',11,8.50,'2022-01-01',3,2);
INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Spiritomb ','Exatamente 108 esp??ritos se reuniram para se tornar este Pok??mon. Aparentemente, h?? alguns esp??ritos mal-humorados na mistura.',4,9.0,'2022-01-01',3,2),
	 ('Litwick ','A chama em sua cabe??a mant??m seu corpo ligeiramente quente. Este Pok??mon pega as crian??as perdidas pela m??o para gui??-las ao mundo espiritual.',1,7.4,'2022-01-01',3,2),
	 ('Spectrier ','Ele sonda seus arredores com todos os seus sentidos, exceto um - ele n??o usa o sentido da vis??o. Dizem que os chutes de Spectrier separam a alma do corpo.',9,200.00,'2022-01-01',3,2),
	 ('Wishiwashi ','Individualmente, eles s??o incrivelmente fracos. ?? reunindo-se nas escolas que eles s??o capazes de enfrentar os oponentes.',74,14,'2022-08-24',4,1),
	 ('Greninja ','Ele cria estrelas de arremesso de ??gua comprimida. Quando as gira e as lan??a em alta velocidade, essas estrelas podem dividir o metal em dois.',36,34,'2021-01-01',4,3),
	 ('Pikachu ','Pikachu pode gerar eletricidade poderosa, tem bolsas nas bochechas que s??o extra macias e super el??sticas.',3,15,'2022-01-01',5,5),
	 ('Mareep ','As roupas feitas de l?? de Mareep s??o facilmente carregadas com eletricidade est??tica, ent??o um processo especial ?? usado nela.',6,22,'2022-01-01',5,5),
	 ('Dedenne ','Os bigodes de um Dedenne captam ondas el??tricas que outros Dedenne enviam. Esses Pok??mon compartilham locais de comida ou eletricidade entre si.',88,39,'2022-01-01',5,6),
	 ('Raikou ','Raikou incorpora a velocidade do rel??mpago. Os rugidos deste Pok??mon enviam ondas de choque que estremecem o ar e sacodem o ch??o como se rel??mpagos tivessem ca??do.',42,178,'2022-01-01',5,5),
	 ('Electivire ','A quantidade de energia el??trica que este Pok??mon produz ?? proporcional ?? taxa de seu pulso. A tens??o salta enquanto o Electivire est?? lutando.',27,5.99,'2022-01-01',5,6);
INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Dratini ','Dratini mora perto de corpos de ??gua que fluem rapidamente, como as piscinas de cachoeiras. ?? medida que cresce, Dratini muda de pele muitas vezes.',43,6,'2022-08-24',7,5),
	 ('Salamamce ','Salamence ?? um Pok??mon incomum, pois foi capaz de evoluir um corpo com asas apenas desejando constantemente poder voar.',47,14,'2022-08-24',7,5),
	 ('Hydreigon ','H?? uma s??rie de hist??rias sobre aldeias que foram destru??das por Hydreigon. Ele morde qualquer coisa que se mova.',13,17,'2022-08-24',7,5),
	 ('Dragapult ','Quando n??o est?? lutando, mant??m Dreepy nos buracos em seus chifres. Uma vez que uma luta come??a, ele lan??a o Dreepy como m??sseis supers??nicos.',56,16,'2022-08-24',7,5),
	 ('Rayquaza ','Diz-se que Rayquaza viveu por centenas de milh??es de anos. Permanecem as lendas de como acabou o confronto entre Kyogre e Groudon',7,350,'2022-08-24',7,5),
	 ('Gardevoir ','Tem o poder de prever o futuro. Seu poder atinge o pico quando est?? protegendo seu Treinador.',55,71,'2022-08-24',8,4),
	 ('Lugia ','As asas de Lugia possuem um poder devastador ??? um leve bater de suas asas pode destruir casas comuns. Como resultado, este Pok??mon escolhe viver fora de vista nas profundezas do mar.',36,290,'2022-08-24',8,4),
	 ('Meditite ','Meditite realiza um rigoroso treinamento mental nas profundezas das montanhas. No entanto, sempre que medita, este Pok??mon sempre perde a concentra????o e o foco. Como resultado, seu treinamento nunca termina.',73,81,'2022-08-24',8,4),
	 ('Charizard ',' Ele cospe fogo que ?? quente o suficiente para derreter pedregulhos. Pode causar inc??ndios florestais soprando chamas.',11,23,'2022-01-01',1,4),
	 ('Misdreavus ','O que d?? sentido ?? sua vida ?? surpreender os outros. Se voc?? encostar o ouvido nas esferas vermelhas em volta do pesco??o, poder?? ouvir gritos.',43,5.9,'2022-01-01',3,2);
INSERT INTO public.produto (prod_tx_nome,prod_tx_descricao,prod_int_quantidade,prod_dec_valor,prod_dt_fabricacao,cat_cd_id,func_cd_id) VALUES
	 ('Poliwag ','Para Poliwag, nadar ?? mais f??cil do que caminhar. O padr??o de redemoinho em sua barriga ??, na verdade, parte das entranhas do Pok??mon que aparecem atrav??s da pele.',15,10.50,'2022-08-04',4,1),
	 ('Swampert ','Swampert ?? muito forte. Tem poder suficiente para arrastar facilmente uma pedra pesando mais de uma tonelada. Este Pok??mon tamb??m tem uma vis??o poderosa que permite ver mesmo em ??guas turvas.',10,15.00,'2005-10-04',4,1),
	 ('Quagsire ','Tem uma natureza descontra??da. Ele n??o se importa se bater a cabe??a em barcos e pedregulhos enquanto nada.',3,29.00,'2021-08-09',4,1),
	 ('Bulbasaur ','H?? uma semente de planta nas costas desde o dia em que este Pok??mon nasce. A semente cresce lentamente.',11,77,'2000-01-01',6,6),
	 ('Sceptile ','As folhas que crescem no corpo de Sceptile s??o muito afiadas. Este Pok??mon ?? muito ??gil - salta por cima dos galhos das ??rvores e salta sobre o inimigo por cima ou por tr??s.',6,45,'2000-01-01',6,6),
	 ('Roselia ','Suas flores exalam uma fragr??ncia relaxante. Quanto mais forte o seu aroma, mais saud??vel ?? a Roselia.',5,18,'2000-01-01',6,6),
	 ('Amoongus ','Este Pok??mon sopra esporos venenosos em seus inimigos. Se os esporos n??o forem lavados rapidamente, eles se transformar??o em cogumelos onde quer que pousem.',99,73,'2000-01-01',6,6),
	 ('Rillaboom ','Ao tocar bateria, ele aproveita o poder de seu toco de ??rvore especial. As ra??zes do toco seguem sua dire????o na batalha.',150,28,'2000-01-01',6,6),
	 ('Abra ','Este Pok??mon usa seus poderes ps??quicos enquanto dorme. O conte??do dos sonhos de Abra afeta os poderes que o Pok??mon exerce.',10,45,'2022-08-24',8,4),
	 ('Mr.Mime','A largura de suas m??os pode n??o ser coincid??ncia ??? muitos cientistas acreditam que suas palmas se tornaram maiores especificamente para a m??mica.',11,38,'2022-08-24',8,4);
	
	
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
	prod.prod_dec_valor as "Valor Unit??rio",
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















