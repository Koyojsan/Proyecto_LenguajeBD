/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.service.impl;

import com.Wittys.Wittys.domain.Mascotas;
import com.Wittys.Wittys.services.MascotasService;
import com.WittysDao.Wittys.dao.WittysDao;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author USER
 */
public class MascotasServiceImpl implements MascotasService {
    @Autowired
    private WittysDao wittysDao;
    
    @Override
    @Transactional (readOnly=true)
    public Mascotas getMascotas (Mascotas mascotas){
        return wittysDao.finByid(mascotas.getMascotas().orElse(null));
    }
    
    @Override
    @Transactional 
    public void save(Mascotas mascotas){
        wittysDao.save(mascotas);}
    
    @Override
    @Transactional 
    public void delete(Mascotas mascotas){
        wittysDao.delete(mascotas);
    }
}
