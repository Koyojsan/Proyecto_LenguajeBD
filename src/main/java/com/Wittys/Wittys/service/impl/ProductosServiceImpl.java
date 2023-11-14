/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.service.impl;

import com.Wittys.Wittys.domain.Productos;
import com.Wittys.Wittys.services.ProductosService;
import com.WittysDao.Wittys.dao.WittysDao;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author USER
 */
public class ProductosServiceImpl implements ProductosService{
    @Autowired
    private WittysDao wittysDao;
    
    @Override
    @Transactional (readOnly=true)
    public Productos getProductos (Productos productos){
        return wittysDao.finByid(Productos.getProductos().orElse(null));
    }
    
    @Override
    @Transactional 
    public void save(Productos productos){
        wittysDao.save(productos);}
    
    @Override
    @Transactional 
    public void delete(Productos productos){
        wittysDao.delete(productos);
    }
}
