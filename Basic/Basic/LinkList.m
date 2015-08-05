//
//  Linklist.m
//  Basic
//
//  Created by YuIan on 15/8/5.
//
//

#import "LinkList.h"

@implementation LinkList


typedef struct node{
    int data;
    struct node *next;
}ListNode;

typedef ListNode *Linklist;
ListNode *p;


void PrintLinklist(Linklist head) {
    
    while (head->next != NULL) {
        head = head->next;
        printf("%d ",head->data);
    }
    printf("\n");
}


Linklist List() {
    
    Linklist head = (ListNode *)malloc(sizeof(ListNode));
    ListNode *p, *r;
    r = head;
    for (int i = 0; i < 10; i++) {
        p = (ListNode *)malloc(sizeof(ListNode));
        p->data = i;
        r->next = p;
        r = p;
    }
    r->next = NULL;
    return head;
}

// 删除节点
void DeleteNode(Linklist head, int i) {
    int k = 0;
    Linklist p, q;
    p = head;
    q = head;
    while (p != NULL) {
        if (k == i) {
            q->next = p->next;
            free(p);
            break;
        }
        q = p;
        p = p->next;
        k++;
    }
}

// 增加尾节点
void AddNodeTotTail(Linklist head, ListNode *node) {
    if (head == NULL) {
        return;
    }
    Linklist p = head;
    while (p->next != NULL) {
        p = p->next;
    }
    p->next = node;
}

// 增加头节点
void AddNodeToFront(Linklist head, ListNode *node) {
    node->next = head->next;
    head->next = node;
}

// 按位置增加
void AddNodeAtIndex(Linklist head, ListNode *node, int i) {
    if (head == NULL) {
        return;
    }
    if (i == 0) {
        AddNodeToFront(head, node);
        return;
    }
    Linklist p = head;
    Linklist q;
    int k = 1;
    while (k++ != i && p->next != NULL) {
        p = p->next;
    }
    
    q = p->next;
    p->next = node;
    node->next = q;
}



// 链表翻转
Linklist RevertList(Linklist head) {
    
    if (head == NULL || head->next == NULL) {
        return head;
    }
    
    Linklist pre = NULL;
    Linklist next = NULL;
    while (head != NULL) {
        next = head->next;
        
        head->next = pre;
        pre = head;
        head = next;
    }
    return pre;
}


void m() {
    Linklist h = List();
    PrintLinklist(h);
    
    //    DeleteNode(h, 10);
    
    //    Linklist hh = RevertList(h);
    
    ListNode *n = (ListNode *)malloc(sizeof(ListNode));
    n->data = 20;
    n->next = NULL;
    //    AddNodeToFront(h,n);
    //    AddNode(h, n);
    AddNodeAtIndex(h, n, 100);
    
    PrintLinklist(h);
}

@end
