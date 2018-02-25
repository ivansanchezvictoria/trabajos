

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vehiculos` DEFAULT CHARACTER SET utf8 ;
USE `vehiculos` ;

-- -----------------------------------------------------
-- Table `Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Roles` (
  `id_rol` INT NOT NULL,
  `nombre_rol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `usuario` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT NULL,
  `id_rol` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_Clientes_Roles_idx` (`id_rol` ASC),
  CONSTRAINT `fk_Clientes_Roles`
    FOREIGN KEY (`id_rol`)
    REFERENCES `mydb`.`Roles` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marca_vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Marca_vehiculos` (
  `id_marca` INT NOT NULL AUTO_INCREMENT,
  `marca_vehiculo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Modelos` (
  `id_modelo` INT NOT NULL AUTO_INCREMENT,
  `nombre_modelo` VARCHAR(45) NULL,
  `id_marca` INT NOT NULL,
  PRIMARY KEY (`id_modelo`),
  INDEX `fk_Modelos_Vehiculos1_idx` (`id_marca` ASC),
  CONSTRAINT `fk_Modelos_Vehiculos1`
    FOREIGN KEY (`id_marca`)
    REFERENCES `vehiculos`.`Marca_vehiculos` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Productos` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(45) NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Productos_Modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Productos_Modelos` (
  `Productos_id_producto` INT NOT NULL,
  `Modelos_id_modelo` INT NOT NULL,
  PRIMARY KEY (`Productos_id_producto`, `Modelos_id_modelo`),
  INDEX `fk_Productos_has_Modelos_Modelos1_idx` (`Modelos_id_modelo` ASC),
  INDEX `fk_Productos_has_Modelos_Productos1_idx` (`Productos_id_producto` ASC),
  CONSTRAINT `fk_Productos_has_Modelos_Productos1`
    FOREIGN KEY (`Productos_id_producto`)
    REFERENCES `mydb`.`Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Modelos_Modelos1`
    FOREIGN KEY (`Modelos_id_modelo`)
    REFERENCES `vehiculos`.`Modelos` (`id_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Frenado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Frenado` (
  `id_prod_frenado` INT NOT NULL AUTO_INCREMENT,
  `nombre_prod_frenado` VARCHAR(45) NULL,
  `precio_prod_frenado` FLOAT NULL,
  `imagen_prod_frenado` VARCHAR(45) NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_prod_frenado`),
  INDEX `fk_Frenado_Productos1_idx` (`id_producto` ASC),
  CONSTRAINT `fk_Frenado_Productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `vehiculos`.`Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes_has_Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Clientes_has_Productos` (
  `Clientes_id_cliente` INT NOT NULL,
  `Productos_id_producto` INT NOT NULL,
  `Fecha_compra` DATE NULL,
  PRIMARY KEY (`Clientes_id_cliente`, `Productos_id_producto`),
  INDEX `fk_Clientes_has_Productos_Productos1_idx` (`Productos_id_producto` ASC),
  INDEX `fk_Clientes_has_Productos_Clientes1_idx` (`Clientes_id_cliente` ASC),
  CONSTRAINT `fk_Clientes_has_Productos_Clientes1`
    FOREIGN KEY (`Clientes_id_cliente`)
    REFERENCES `vehiculos`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_has_Productos_Productos1`
    FOREIGN KEY (`Productos_id_producto`)
    REFERENCES `vehiculos`.`Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Escape`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vehiculos`.`Escape` (
  `id_prod_escape` INT NOT NULL AUTO_INCREMENT,
  `nombre_prod_escape` VARCHAR(45) NULL,
  `precio_prod_escape` FLOAT NULL,
  `imagen_prod_escape` VARCHAR(45) NULL,
  `id_producto` INT NOT NULL,
  PRIMARY KEY (`id_prod_escape`),
  INDEX `fk_Escape_Productos1_idx` (`id_producto` ASC),
  CONSTRAINT `fk_Escape_Productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `vehiculos`.`Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
