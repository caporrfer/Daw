package com.entities;

import com.entities.articulos;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2022-01-27T13:32:45")
@StaticMetamodel(usuarios.class)
public class usuarios_ { 

    public static volatile SingularAttribute<usuarios, String> clave;
    public static volatile SingularAttribute<usuarios, String> twitter;
    public static volatile SingularAttribute<usuarios, String> correo;
    public static volatile SingularAttribute<usuarios, String> facebook;
    public static volatile ListAttribute<usuarios, articulos> lArticulos;
    public static volatile SingularAttribute<usuarios, String> direccion;
    public static volatile SingularAttribute<usuarios, Long> id;
    public static volatile SingularAttribute<usuarios, String> nombre;
    public static volatile SingularAttribute<usuarios, Integer> cp;
    public static volatile SingularAttribute<usuarios, Long> tlf;

}