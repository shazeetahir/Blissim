<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Product;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    // this shows a product page in detail
    #[Route('/product/{id<\d+>}', name: 'product', requirements: ['id' => '\d+'])]
    public function product(Product $product, Request $request, PaginatorInterface $paginator, CommentRepository $commentRepository): Response
    {
        // dd($product);
        
        // paginating comments using knp paginator bundle
        $pagination = $paginator->paginate(
            // call to paginationQuery function 
            $commentRepository->paginationQuery($product),
            $request->query->getInt('page', 1),
            4
        );

        return $this->render('product/product.html.twig', [
            'product' => $product,
            'pagination' => $pagination,
        ]);
    }

    // adding review given by a connected user
    #[Route('/product/{product<\d+>}/review', name: 'addProductReview', requirements: ['id' => '\d+'])]
    public function addReview(Product $product, Request $request, EntityManagerInterface $manager)
    {      
        // redirecting if user tries to be over smart and writes the route in url
        if ( (!$this->isGranted("ROLE_USER")) ) {
            return $this->redirectToRoute('app_home');
        }

        $review = $request->request->get('review');
        $user = $this->getUser();

        $comment = new Comment();
        $comment->setProduct($product);
        $comment->setUser($user);
        $comment->setReview($review);
        $comment->setDate(new \DateTime);

        $manager->persist($comment);
        $manager->flush();

        $this->addFlash(
            "success",
            "Votre commentaire a été enregistré avec succès."
        );

        return $this->redirectToRoute('product', ['id' => $product->getId()]);

    }



    // delete review given by a connected user
    #[Route('/product/review/{comment<\d+>}/delete', name: 'deleteProductReview', requirements: ['id' => '\d+'])]
    public function deleteReview(Comment $comment, EntityManagerInterface $manager)
    {      
        // redirecting if use writes the path in url or if the user of the comment is not the user connected
        if (  (!$this->isGranted("ROLE_USER")) || ($comment->getUser() != $this->getUser()) ) {
            return $this->redirectToRoute('product', ['id' => $comment->getProduct()->getId()]);
        }

        // dd($comment->getProduct()->getId());

        // continue to delete the comment otherwise
        $manager->remove($comment);
        $manager->flush();

        $this->addFlash(
            "success",
            "Votre commentaire a été supprimé avec succès."
        );

        return $this->redirectToRoute('product', ['id' => $comment->getProduct()->getId()]);
        
    }

    
}
