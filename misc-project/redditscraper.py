import praw
import pandas as pd

# Reddit API credentials
REDDIT_CLIENT_ID = 'vjUGFEvNJUzm7aJnTeGb0Q'
REDDIT_CLIENT_SECRET = 'pRt28H5kfVKkdVk0FG8fLE8qOPN0pA'
REDDIT_USER_AGENT = 'kgw2.0/1.0 (by u/clothedandnotafraid)'
REDDIT_USERNAME = 'clothedandnotafraid'

# Initialize Reddit instance
reddit = praw.Reddit(
    client_id=REDDIT_CLIENT_ID,
    client_secret=REDDIT_CLIENT_SECRET,
    user_agent=REDDIT_USER_AGENT,
    username=REDDIT_USERNAME
)

def scrape_comments(username):
    user = reddit.redditor(username)
    comments_data = []

    for comment in user.comments.new(limit=None):  # Set limit to None to get all comments
        comment_info = {
            'comment_id': comment.id,
            'comment_body': comment.body,
            'comment_created_utc': comment.created_utc,
            'post_title': comment.submission.title,
            'post_id': comment.submission.id,
            'post_url': comment.submission.url
        }
        comments_data.append(comment_info)
        print(f"Fetched comment: {comment.id}")

    return comments_data

def save_to_csv(comments_data, filename='reddit_comments.csv'):
    df = pd.DataFrame(comments_data)
    df.to_csv(filename, index=False)
    print(f"Data saved to {filename}")

if __name__ == '__main__':
    comments = scrape_comments(REDDIT_USERNAME)
    save_to_csv(comments)
