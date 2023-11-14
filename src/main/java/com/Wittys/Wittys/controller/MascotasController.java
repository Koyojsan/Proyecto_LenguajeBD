/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Wittys.Wittys.controller;

import com.Wittys.Wittys.domain.Mascotas;
import com.Wittys.Wittys.services.MascotasService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author USER
 */
@Controller
@Slf4j
@RequestMapping("/Mascotas")
public class MascotasController {
    @Autowired
    private MascotasService mascotasService;
    
    @GetMapping("/Mascotas")
    public String inicio(Model model){
        //var Mascotas = MascotasService(true);
        model.addAttribute("categorias", mascotas);
        model.addAttribute("totalCategorias",Mascotas.size());
        return "/Mascotas/listado";
    }
    @GetMapping("/nuevo")
    public String MascotaNuevo(Mascotas mascotas) {
        return "/Mascota/modifica";
    }
    
    @GetMapping("/eliminar/{IdMascotas}")
    public String categoriaEliminar(Mascotas mascotas) {
        mascotasService.delete(mascotas);
        return "redirect:/Mascota/listado";
    }
    
    @GetMapping("/modificar/{IdMascotas}")
    public String categoriaModificar(Mascotas mascotas, Model model) {
        mascotas = (Mascotas) mascotasService;
        model.addAttribute("mascota", mascotas);
        return "/Mascota/modifica";
    }
}
