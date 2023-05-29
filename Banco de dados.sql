-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/05/2023 às 03:12
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atividade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `codestado` int(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `desconto` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `endereco`, `cidade`, `cep`, `codestado`, `telefone`, `desconto`) VALUES
(101, 'Ana Cláudia', 'Rua Alfa', 'João Pessoa', '55555-555', 1, '(83)99999-8888', 5.00),
(111, 'Maria José', 'Av Alfa', 'João Pessoa', '55555-555', 1, '(83)98899-8888', 12.50),
(502, 'João José', 'Rua Alfa', 'Natal', '22222-22', 4, '(84)9585-8525', 2.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`codigo`, `nome`) VALUES
(1, 'Paraíba'),
(2, 'Pernambuco'),
(3, 'Bahia'),
(4, 'Rio Grande do Norte'),
(5, 'Alagoas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fabricante`
--

INSERT INTO `fabricante` (`codigo`, `nome`) VALUES
('A01', 'HP'),
('A02', 'Compaq'),
('A03', 'DELL'),
('B01', 'Laboremus'),
('B02', 'Agrale'),
('C01', 'Tramontina');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `dataentrada` varchar(40) NOT NULL,
  `valortotal` decimal(10,2) NOT NULL,
  `desconto` decimal(4,2) NOT NULL,
  `dataembarque` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id`, `tipo`, `idcliente`, `dataentrada`, `valortotal`, `desconto`, `dataembarque`) VALUES
(1, 'A vista', 101, '2016-01-25', 3000.00, 10.00, '2016-02-25'),
(2, 'A prazo 30 dias', 111, '2016-01-25', 7001.00, 0.00, '2016-02-25'),
(3, 'A vista', 502, '2016-08-21', 8591.00, 2.00, '2016-09-21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `codfabricante` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`codigo`, `nome`, `preco`, `codfabricante`) VALUES
(1001, 'Forrageira', 3000.00, 'B01'),
(1002, 'Laptop', 3500.00, 'A03'),
(1004, 'Faqueiro', 0.00, 'C01'),
(1010, 'Impressora', 295.00, 'A01'),
(1020, 'Laptop', 5000.00, 'A02'),
(1111, 'Motor 5HP', 0.00, 'B02');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codestado` (`codestado`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codfabricante` (`codfabricante`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codestado`) REFERENCES `estado` (`codigo`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codfabricante`) REFERENCES `fabricante` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
