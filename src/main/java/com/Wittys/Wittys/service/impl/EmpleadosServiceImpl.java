/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.service.impl;

import com.Wittys.Wittys.domain.Empleados;
import com.Wittys.Wittys.services.EmpleadosService;
import com.WittysDao.Wittys.dao.WittysDao;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author USER
 */
public class EmpleadosServiceImpl implements EmpleadosService {
    @Autowired
    private WittysDao wittysDao;
    
    @Override
    @Transactional (readOnly=true)
    public Empleados getEmpleados (Empleados empleados){
        return wittysDao.finByid(Empleados.getEmpleados().orElse(null));
    }
    
    @Override
    @Transactional 
    public void save(Empleados empleados){
        wittysDao.save(empleados);}
    
    @Override
    @Transactional 
    public void delete(Empleados empleados){
        wittysDao.delete(empleados);
    }
}
