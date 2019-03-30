<?php

namespace	App\Controller;

use	Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use	Symfony\Component\Routing\Annotation\Route;
use	Symfony\Component\HttpFoundation\Request;
use	App\Entity\User;
use	App\Form\RegisterType;
use	Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use	Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class	UserController	extends	AbstractController	{

	/**
		* @Route("/user", name="user")
		*/
	public	function	register(Request	$request,	UserPasswordEncoderInterface	$encoder)	{
		// Crear el formulario
		$user	=	new	User();
		$form	=	$this->createForm(RegisterType::class,	$user);

		// Rellenar el objeto
		$form->handleRequest($request);

		// Comprobar si se ha enviado el fomulario
		if	($form->isSubmitted()	&&	$form->isValid())	{
			//var_dump($user);
			// Modificando el objeto para guardarlo
			$user->setRole('ROLE_USER');
			// Creando un objeto de fecha y que lo acepte como string en el modelo
			$user->setCreatedAt(new	\DateTime('now'));
			// Cifrar la contraseña
			$encoded	=	$encoder->encodePassword($user,	$user->getPassword());
			$user->setPassword($encoded);

			//var_dump($user);
			// Guardar Usuario
			$em	=	$this->getDoctrine()->getManager();
			$em->persist($user);
			$em->flush();

			return	$this->redirectToRoute('tasks');
		}
		return	$this->render('user/register.html.twig',	[
														'form'	=>	$form->createView(),
		]);
	}

	public	function	login(AuthenticationUtils	$autenticationUtils)	{
		$error	=	$autenticationUtils->getLastAuthenticationError();
		$lastUserName	=	$autenticationUtils->getLastUsername();
		return	$this->render('user/login.html.twig',	array(
														'error'	=>	$error,
														'last_username'	=>	$lastUserName
		));
	}

}
