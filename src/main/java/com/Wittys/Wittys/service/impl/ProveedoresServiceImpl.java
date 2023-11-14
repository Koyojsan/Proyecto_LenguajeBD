/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.service.impl;

import com.Wittys.Wittys.domain.Productos;
import com.Wittys.Wittys.domain.Proveedores;
import com.Wittys.Wittys.services.ProveedoresService;
import com.WittysDao.Wittys.dao.WittysDao;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author USER
 */
public class ProveedoresServiceImpl implements ProveedoresService{
    @Autowired
    private WittysDao wittysDao;
    
    @Override
    @Transactional (readOnly=true)
    public Proveedores getProveedores (Proveedores proveedores){
        return wittysDao.finByid(Productos.getProductos().orElse(null));
    }
    
    @Override
    @Transactional 
    public void save(Proveedores proveedores){
        wittysDao.save(proveedores);}
    
    @Override
    @Transactional 
    public void delete(Proveedores proveedores){
        wittysDao.delete(proveedores);
    }
}
