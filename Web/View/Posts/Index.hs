module Web.View.Posts.Index where
import Web.View.Prelude

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PostsAction}>Posts</a></li>
            </ol>
        </nav>
        <!--<h1>Index <a href={pathTo NewPostAction} class="btn btn-primary ml-4">+ New</a></h1>-->
        <div class="table-responsive">
                <div class="flex-col">{forEach posts renderPost}</div>
        </div>
    |]


renderPost post = [hsx|
<a href={ShowPostAction (get #id post)}>
<div class="my-4 p-2 bg-red-50 dark:bg-gray-900 rounded shadow-lg flex items-center justify-center
    w-full hover:bg-red-100 transition ease-in 30">
  <div class="px-5 py-4 dark:bg-gray-800 rounded-lg object-contain w-full">
    <div class="flex mb-4">
      <div class="ml-2 mt-0.5">
        <span class="block font-medium text-base leading-snug text-black
        dark:text-gray-100">Author Name</span>
        <span class="block text-sm text-gray-500 dark:text-gray-400 font-light leading-snug">{get #createdAt post}</span>
      </div>
    </div>
    <p class="text-gray-800 dark:text-gray-100 leading-snug
    md:leading-normal">{get #body post}</p>
    <div class="flex justify-between items-center mt-5">
    <div class="flex ">
      <span class="mr-6 text-green-500 dark:text-gray-400 font-light">{get #upvotes post}</span>
      <span class="mr-6 text-red-500 dark:text-gray-400 font-light">{get #downvotes post}</span>
    </div>  
    <div class="ml-1 text-gray-500 dark:text-gray-400 font-light">Score: {get #toxicityScore post}</div>
    </div>
  </div>
</div>
</a>
|]
