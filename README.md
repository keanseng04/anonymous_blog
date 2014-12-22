<div class="container">
<div id="challenge" class="row">
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12">
<div class="tab-content">
<div id="body" class="tab-pane fade in active">

We're going to write a simple homepage with a blog. This will be our first many-to-many relationship inside the context of Sinatra. Later, we'll integrate user authentication.

Do the <a href="http://learn.codedivision.my/challenges/115">Sinatra sandbox challenge</a> first if you don't feel comfortable with the flow of a web application or how forms send data to the server.

We'll have two core models: posts and tags. A post can have many tags and a tag can be on many posts.

Here is our trusty <a href="http://ge.tt/8fpASR22/v/0?c">sinatra skeleton for you to use</a>.
<h2>Learning Goals</h2>
<ul>
	<li>Many-to-many associations in ActiveRecord.</li>
	<li>How to use multiple files for controller routes.</li>
	<li>ActiveRecord validations.</li>
</ul>
<h2>Objectives</h2>
<h3>Controllers &amp; Routes</h3>
Think about your controllers and routes. Consider making three controller files:
<ol>
	<li><code>app/controllers/index.rb</code></li>
	<li><code>app/controllers/posts.rb</code></li>
	<li><code>app/controllers/tags.rb</code></li>
</ol>
The <code>index</code> controller will just have the index route, displaying your homepage. All <code>Post</code>-related routes will go in the<code>posts</code> controller and all <code>Tag</code>-related routes will go in the <code>tags</code> controller.

These are the operations we want to support for posts:
<ol>
	<li>Show me all posts</li>
	<li>Show me a particular post</li>
	<li>Create a new post</li>
	<li>Edit an existing post</li>
	<li>Delete an existing post</li>
</ol>
These are the operations we want to support for tags:
<ol>
	<li>Show me all posts with a given tag</li>
</ol>
Tags will be created via the <code>Post</code>-creation form.
<h3>Models &amp; Validations</h3>
Create all the necessary models and migrations to support the above. You should have three models - what are they?

Add the appropriate validations to your models. Read the <a href="http://guides.rubyonrails.org/active_record_validations_callbacks.html">Rails guide to ActiveRecord validations</a> for reference.

For example, if your <code>Post</code> model has <code>body</code> and <code>title</code> fields, you probably don't want to permit a <code>Post</code> that has no<code>body</code> or <code>title</code> to be saved to the database. This means adding <code>NOT NULL</code> constraints to the migrations and the following validations to your ActiveRecord model:
<div class="highlight">
<pre>class Post &lt; ActiveRecord::Base
  validates :body, :presence <span class="o">=</span>&gt; <span class="nb">true</span>
  validates :title, :presence <span class="o">=</span>&gt; <span class="nb">true</span>
end
</pre>
</div>
You'll have other fields and validations, to be sure. What fields do you want your blog post to have? Author?
<h3>Design Simple Pages and Forms</h3>
Design simple pages and forms to implement all the above functionality. It doesn't need to be styled well, but if your HTML is well-structured it will make it easier to style later.

Your forms for creating and updating <code>Post</code> models should allow you to enter tags. You can decide how that works, although from a user experience perspective it would be incredibly tedious to have to create tags elsewhere before a post author can use them. However, if a post author uses a tag that already exists, you aren't going to want to create a new row in the <code>tags</code> table, but rather re-use the already-existing tag.

One idea might be to permit them to enter tags like this:
<div class="highlight">
<pre>&lt;label <span class="k">for</span><span class="o">=</span><span class="s2">"post_tags"</span>&gt;Tags:&lt;/label&gt;
&lt;input <span class="nv">id</span><span class="o">=</span><span class="s2">"post_tags"</span> <span class="nv">name</span><span class="o">=</span><span class="s2">"post[tags]"</span> <span class="nv">value</span><span class="o">=</span><span class="s2">"tag1, tag2, some other tag, a fourth tag"</span>&gt;
</pre>
</div>
which renders as:

<label for="post_tags">Tags:</label><input id="post_tags" class="span4" tabindex="7" name="post[tags]" type="text" value="tag1, tag2, some other tag, a fourth tag" />

All your routes should now implement their basic functionality. You should be able to list, show, create, update, and delete posts. You should also be able to see all posts for a given tag at a url like
<div class="highlight">
<pre>http://localhost:9393/tag/apple
</pre>
</div>
<h3>Error Cases</h3>
Using <a href="http://guides.rubyonrails.org/active_record_validations_callbacks.html#valid-and-invalid">valid? and invalid?</a> and the <a href="http://guides.rubyonrails.org/active_record_validations_callbacks.html#validations_overview-errors">errors</a> methods, make sure you're handling your error cases gracefully. It doesn't need to be perfect, but good error handling means:
<ol>
	<li>When a user makes a mistake or breaks some rule, they're informed</li>
	<li>The user is presented with an opportunity to correct the mistake, if possible</li>
	<li>The user is given as much guidance as possible about that they need to do to fix the error</li>
</ol>
<h3>Style! Style! Style!</h3>
You might want to do the <a href="http://learn.codedivision.my/challenges/222">Layout Drill: Proper Typesetting</a> first, if you haven't. But following the guidelines from that challenge, spruce up your blog design.

If you have time, try to make it something you're proud to look at.

</div>
</div>
</div>
</div>
</div>
</div>
</div>
&nbsp;
