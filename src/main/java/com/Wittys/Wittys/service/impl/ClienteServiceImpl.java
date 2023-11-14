/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.service.impl;

import com.Wittys.Wittys.domain.Clientes;
import com.Wittys.Wittys.services.ClientesService;
import com.WittysDao.Wittys.dao.WittysDao;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author USER
 */
@Service
public class ClienteServiceImpl implements ClientesService{
    @Autowired
    private WittysDao wittysDao;
    
    @Override
    @Transactional (readOnly=true)
    public Clientes getClientes (Clientes clientes){
        return wittysDao.finByid(Clientes.getClientes().orElse(null));
    }
    
    @Override
    @Transactional 
    public void save(Clientes clientes){
        wittysDao.save(clientes);}
    
    @Override
    @Transactional 
    public void delete(Clientes clientes){
        wittysDao.delete(clientes);
    }
    
}
