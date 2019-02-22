;*****************************************************************
;* Programmer: Kyle Knudson                                      *
;*                                                               *
;* Title: Bacteria identification program                        *
;*                                                               *
;*                                                               *
;* Date: 2/15/19                                                 *
;*                                                               *
;* Description: Bacteria can be classified by several            *
;* characteristics including their basic shape, the results of   *
;* a laboratory gram stain test and whether they require oxygen  *
;* to survive.                                                   *
;*                                                               *
;*                                                               *
;*                                                               *
;*                                                               *
;*                                                               *
;* Program:                                                      *
;* Write a program that identifies the bacteria type based on    *
;* the information stored in the table below. The program should *
;* ask the user for the shape, gram, and oxygen requirements of  *
;* the bacteria.  The user should be able to specify that any    *
;* of the inputs is unknown.  The output of the program should   *
;* be all of the possible bacteria types based on the            *
;* information from the user.                                    *
;*****************************************************************



;   Type                Shape                   Gram stain              Oxygen requirements
; ________________________________________________________________________________________________
;   Actinomycete        rod or filamentous      positive                aerobic
;   Coccoid             spherical               positive                aerobic and anaerobic
;   Coryneform          rod                     positive                aerobic
;   Endospore-forming   rod                     positive or negative    aerobic and anaerobic
;   Enteric             rod                     negative                aerobic
;   Gliding             rod                     negative                aerobic
;   Mycobacterium       spherical               none                    aerobic
;   Mycoplasma          spherical               none                    aerobic
;   Pseudomonad         rod                     negative                aerobic
;   Rickettsia          spherical or rod        negative                aerobic
;   Sheathed            filamentous             negative                aerobic
;   Spirillum           spiral                  negative                aerobic
;   Spirochete          spiral                  negative                anaerobic
;   Vibrio              rod                     negative                aerobic

;**********************************
;deftemplate                      *
;**********************************


(deftemplate bacteria
 (slot name)
 (multislot shape) 
 (multislot Gram-Stain) 
 (multislot Oxygen-Requirements))

 (deftemplate find-bacteria
 (multislot shape)
 (multislot Gram-Stain)
 (multislot Oxygen-Requirements))



;**********************************
;deffacts                         *
;**********************************


(deffacts bacteria-known 
           
(bacteria
(name Actinomycete)
(shape rod filamentous unknown)
(Gram-Stain positive unknown )
(Oxygen-Requirements aerobic unknown))

                                         
(bacteria
(name Coccoid)
(shape spherical unknown)
(Gram-Stain  positive unknown)
(Oxygen-Requirements both unknown))

                                              
(bacteria
(name Coryneform)
(shape rod unknown)
(Gram-Stain positive unknown)
(Oxygen-Requirements aerobic unknown))

                            
(bacteria
(name Endospore-forming)
(shape rod unknown)
(Gram-Stain positive negative unknown)
(Oxygen-Requirements both unknown))

                                                  
(bacteria
(name Enteric)
(shape rod unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements aerobic unknown))

                                                 
(bacteria
(name Gliding)
(shape rod unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements aerobic unknown))

                                      
(bacteria
(name Mycobacterium)
(shape spherical unknown)
(Gram-Stain none unknown)
(Oxygen-Requirements aerobic unknown))


(bacteria
(name Mycoplasma)
(shape spherical unknown)
(Gram-Stain none unknown)
(Oxygen-Requirements aerobic unknown))

                                            
(bacteria
(name Pseudomonad)
(shape  rod unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements aerobic unknown))

                               
(bacteria
(name Rickettsia )
(shape spherical rod unknown)
(Gram-Stain  negative unknown)
(Oxygen-Requirements aerobic unknown))

                                      
(bacteria
(name Sheathed )
(shape filamentous unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements  aerobic unknown))

                                            
(bacteria
(name Spirillum)
(shape spiral unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements aerobic unknown))

                                           
(bacteria
(name Spirochete)
(shape spiral unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements anaerobic unknown))

                                                  
(bacteria
(name Vibrio)
(shape rod unknown)
(Gram-Stain negative unknown)
(Oxygen-Requirements aerobic unknown))
)



;**********************************
;defrules                         *
;**********************************


(defrule Welcome
 (declare (salience 50))
=>
(printout t "Welcome to the Bacteria identification Program" crlf)
(printout t "----------------------------------------------------------" crlf))


(defrule get-shape
 (declare (salience 40))
=>
(printout t "What is the bacteria's shape? " crlf)
(bind ?response (read))
f15 <- (assert (find-bacteria(shape ?response)))
)

(defrule get-gram-stain
=>
(printout t "What is the bacteria's gram-stain? (positive, negative or none)? " crlf )
(bind ?user-response(read))
(modify 15 (Gram-Stain ?user-response))
)

(defrule get-Oxygen-Requirements
=>
(printout t "What is the Oxygen Requirements of the bacteria? (aerobic, anaerobic or both)" crlf)
(bind ?uresponse(read))
(modify 15 (Oxygen-Requirements ?uresponse))
)

(defrule match-bacteria
    (find-bacteria(shape ?shape) (Gram-Stain ?stain) (Oxygen-Requirements ?oxygen-require))
    (bacteria (name ?name) (shape $? ?shape $?)  (Gram-Stain $? ?stain $?) (Oxygen-Requirements $? ?oxygen-require $?))
=>
    (printout t  "Potential Match: " ?name  crlf)

)




;**********************************
;Test Runs                        *
;**********************************

;CLIPS> (load C:\\Users\\kylek\\Code\\expert-systems\\bacteria.clp)
;%%$*****
;TRUE
;CLIPS> (reset)
;CLIPS> (run)
;Welcome to the Bacteria identification Program
;----------------------------------------------------------
;What is the bacteria's shape? 
;rod
;What is the bacteria's gram-stain? (positive, negative or none)? 
;positive
;What is the Oxygen Requirements of the bacteria? (aerobic, anaerobic or both)
;aerobic
;Potential Match: Coryneform
;Potential Match: Actinomycete
;CLIPS> (reset)
;CLIPS> (run)
;Welcome to the Bacteria identification Program
;----------------------------------------------------------
;What is the bacteria's shape? 
;unknown
;What is the bacteria's gram-stain? (positive, negative or none)? 
;unknown
;What is the Oxygen Requirements of the bacteria? (aerobic, anaerobic or both)
;unknown
;Potential Match: Vibrio
;Potential Match: Spirochete
;Potential Match: Spirillum
;Potential Match: Sheathed
;Potential Match: Rickettsia
;Potential Match: Pseudomonad
;Potential Match: Mycoplasma
;Potential Match: Mycobacterium
;Potential Match: Gliding
;Potential Match: Enteric
;Potential Match: Endospore-forming
;Potential Match: Coryneform
;Potential Match: Coccoid
;Potential Match: Actinomycete
;CLIPS> (reset)
;CLIPS> (run)
;Welcome to the Bacteria identification Program
;----------------------------------------------------------
;What is the bacteria's shape? 
;unknown
;What is the bacteria's gram-stain? (positive, negative or none)? 
;none
;What is the Oxygen Requirements of the bacteria? (aerobic, anaerobic or both)
;unknown
;Potential Match: Mycoplasma
;Potential Match: Mycobacterium
;CLIPS> (reset)
;CLIPS> (run)
;Welcome to the Bacteria identification Program
;----------------------------------------------------------
;What is the bacteria's shape? 
;unknown
;What is the bacteria's gram-stain? (positive, negative or none)? 
;unknown
;What is the Oxygen Requirements of the bacteria? (aerobic, anaerobic or both)
;both
;Potential Match: Endospore-forming
;Potential Match: Coccoid
;CLIPS> 