<?php

namespace App\Controller;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    // this shows all the products on the homepage
    #[Route('/', name: 'app_home')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $repo = $entityManager->getRepository(Product::class);
        $products = $repo->findAll();
        // dd($products);

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'products' => $products,
        ]);
    }


}
