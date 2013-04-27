package de.clubi.recipe

import groovy.json.JsonOutput
import groovy.json.JsonSlurper

/**
 * Created with IntelliJ IDEA.
 * User: Stefan
 * Date: 27.04.13
 * Time: 05:02
 * To change this template use File | Settings | File Templates.
 */
class ChefkochImporter {
    static final String SEARCH="http://api.chefkoch.de/api/1.0/api-recipe-search.php?limit=20&Suchbegriff=";
    static void main(String[] args){
        new ChefkochImporter().importChefKoch("Käsekuchen")
    }
    def importChefKoch(String search){
        //check for validation first
        String buffer="";
        int start=0
        new URL(SEARCH + search+"&start="+start++).openStream().eachLine { line->
            buffer += line
        }
        def result = new JsonSlurper().parseText(buffer)

        int total = result.total
        def list = []

        while(list.size<total){
            result.result.each{
                list << new ChefKochRecepte(
                            RezeptID : it.RezeptID,
                            RezeptShowID : it.RezeptShowID,
                            RezeptName : it.RezeptName,
                            RezeptName2 : it.RezeptName2,
                            Minuten : it.Minuten,
                            Bild : it.Bild,
                            Bildname_224x148_fix : it.Bildname_224x148_fix,
                            Datum : it.Datum,
                            SchwierigkeitsgradName : it.SchwierigkeitsgradName,
                            user_id : it.user_id,
                            uservote_img : it.uservote_img,
                            ph_boost : it.ph_boost,
                            AdditionalAttributes : it.AdditionalAttributes,
                            RezeptBild : it.RezeptBild
                     )
            }
           if(list.size<total){
               buffer=""
               new URL(SEARCH + search+"&start="+start++).openStream().eachLine { line->
                   buffer += line
               }
               result = new JsonSlurper().parseText(buffer)
           }

        }



        print(list.size)
        //print( new URL(SEARCH+search).openStream() )

        //def cb = new XmlSlurper().parse(file)
    }
}
